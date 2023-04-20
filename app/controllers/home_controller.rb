class HomeController < ApplicationController
  def index
    @teams = Team.all
  end
  def analytics
    @project = Project.find(params[:id])

    @yet_to_start = @project.tasks.where(:status=>"YET-TO-START")
    @in_progress = @project.tasks.where(:status=>"IN-PROGRESS")
    @completed = @project.tasks.where(:status=>"COMPLETED")

    @task_with_one_hours = @project.tasks.where(:Estimation=>"1")
    @task_with_two_hours = @project.tasks.where(:Estimation=>"2")
    @task_with_three_hours = @project.tasks.where(:Estimation=>"3")
    @task_with_four_hours = @project.tasks.where(:Estimation=>"4")
    @task_with_five_hours = @project.tasks.where(:Estimation=>"5")

  end
end
