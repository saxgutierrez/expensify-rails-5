class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @expenses = Expense.all

    # Hacer cálculos solo mostrar números parte superior del Dashboard
    @today = Expense.total(Expense.today)
    @yesterday = Expense.total(Expense.yesterday)
    @month = Expense.total(Expense.month(Date.current))
    @last_month = Expense.total(Expense.last_month)

  end
end
