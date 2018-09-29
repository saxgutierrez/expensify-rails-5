class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :type

  # Se utiliza para hacer operaciones numéricas en dashboard_controller y en la vista index.html.erb de dashboard
  scope :today, -> { where(date: Date.current) }
  scope :day, -> (day) { where(date: day) }
  scope :yesterday, -> { where(date: Date.current - 1.day) }
  scope :month, -> (start, end_month = start) { where(date: start.beginning_of_month..end_month.end_of_month) }
  scope :last_month, -> { where(date: (Date.current - 1.month).beginning_of_month..(Date.current - 1.month).end_of_month) }

  # Se utiliza exclusivamente para las gráficas en dashboard view
  scope :this_month, -> {where('date > ? and date < ?', Time.now.beginning_of_month, Time.now.end_of_month )}
  scope :last_month1, -> {where('date > ? and date < ?', 1.month.ago.beginning_of_month, 1.month.ago.end_of_month)}
  scope :last_six_months, -> {where("date >= ?", 6.months.ago)}#probando

  # métodos que se utilizan en dashboard_controller

  # se utiliza para sacar el total de gastos
  def self.total(expenses)
    expenses.empty? ? 0 : expenses.map { |expense| expense[:amount].to_f }.reduce(:+) #suma los gastos
  end

  # se utiliza para sacar el promedio de gastos
  def self.average(expenses)
    expenses.empty? ? 0 : expenses.map { |expense| expense[:amount].to_f }.reduce(:+) / expenses.size
  end
  
end
