class Task < ApplicationRecord
  belongs_to :project

  after_save :send_task_mail

  def send_task_mail
    TaskMailer.with(user: self.assigned_user, task: self).welcome_mail.deliver_now
  end
end
