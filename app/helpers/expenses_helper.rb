module ExpensesHelper

	def form_controller
		@expense.new_record? ? "create" : "update"	
	end

	def form_button
		@expense.new_record? ? "Crear Expense" : "Actualizar Expense"
	end
end
