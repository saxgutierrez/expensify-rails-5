class ExpensesController < ApplicationController

  def index
   @categories = Category.all
   @types = Type.all
   @expenses = Expense.all
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
   	if @expense.update(post_params)
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
