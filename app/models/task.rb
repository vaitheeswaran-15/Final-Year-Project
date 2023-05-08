class Task < ApplicationRecord
  belongs_to :project

  after_save :send_task_mail

  def send_task_mail
    TaskMailer.with(user: self.assigned_user, task: self).welcome_mail.deliver_now
  end

  def self.send_notification(dead_task)
    TaskMailer.with(user: dead_task.assigned_user, task: dead_task).time_exceed.deliver_now
  end
end
