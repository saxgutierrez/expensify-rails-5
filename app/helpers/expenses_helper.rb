module ExpensesHelper

	def form_controller
		@expense.new_record? ? "create" : "update"	
	end

	def form_button
		@expense.new_record? ? "Crear Expense" : "Actualizar Expense"
	end
	# se utiliza para el filtro de fechas
	def months_list
	    (Date.today-1.year..Date.today).map{|d| [d.strftime("%b-%Y"), d.strftime("%m-%Y")]}.uniq.reverse
	end
end
