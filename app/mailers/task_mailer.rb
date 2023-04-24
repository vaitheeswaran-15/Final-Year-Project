class TaskMailer < ApplicationMailer

  def welcome_mail
    @user = params[:user]
    @task = params[:task]
    @task_name = @task.title
    @url = project_task_url(@task.project_id, @task)
    mail(to: @user, subject: "Task Assigned")
  end

end
