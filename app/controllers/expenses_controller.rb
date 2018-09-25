class ExpensesController < ApplicationController

  def index
   @categories = Category.all
   @types = Type.all
   @expenses = Expense.all

       
       if params[:type_id].present?
         @expenses = @expenses.where("type_id = ?", params[:type_id]) #busca el id
       end

       if params[:category_id].present?
         @expenses = @expenses.where("category_id = ?", params[:category_id]) #busca el id
       end

       if params[:category_id].present? && params[:type_id].present?
         @expenses = @expenses.where("category_id = ?", params[:category_id]).where("type_id = ?", params[:type_id]) #busca el id
       end
   


  end

  def new
  @expense = Expense.new
  end

  def show
  @expense = Expense.find(params[:id])
  end

  def create
  @expense = Expense.new(expense_params)
	if @expense.save
		redirect_to expenses_path, notice: "Expense creado con éxito"
	else
		render :new
	end
  end

  def edit
  @expense = Expense.find(params[:id])
  end

  def destroy
  @expense = Expense.find(params[:id])
  @expense.destroy
  redirect_to expenses_path, notice: "Expense eliminado con éxito"
  end

  def update
  @expense = Expense.find(params[:id])
   	if @expense.update(expense_params)
   		redirect_to expenses_path, notice: "Expense modificado exitosamente"
   	else
   		render :edit
   	end
  end

   protected
    def expense_params
      params.require(:expense).permit(:concept, :date, :amount, :category_id, :type_id)
    end
end
