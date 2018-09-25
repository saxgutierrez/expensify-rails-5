class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @expenses = Expense.all
  end
end
