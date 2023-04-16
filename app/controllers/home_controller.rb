class HomeController < ApplicationController
  def index
    @teams = Team.all
  end
  def analytics
    @project = Project.find(params[:id])
    @yet_to_start = @project.tasks.where(:status=>"YET TO START")
    @in_progress = @project.tasks.where(:status=>"IN PROGRESS")
    @completed = @project.tasks.where(:status=>"COMPLETED")
  end
end
