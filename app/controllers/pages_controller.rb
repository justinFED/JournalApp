class PagesController < ApplicationController
  def landing
    @tasks_today = Task.where("due_date = ?", Date.today)
    @tasks = Task.all
  end
end
