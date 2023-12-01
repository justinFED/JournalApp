class PagesController < ApplicationController
  def landing
    @tasks_today = Task.view_tasks_for_today
    @tasks = Task.all
  end
end
