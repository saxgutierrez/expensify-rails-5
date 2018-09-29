class ExpensesController < ApplicationController

  def index
   @tab = :expenses
   @categories = Category.all
   @types = Type.all
   @expenses = Expense.all
   @expenses = @expenses.order('date DESC')
   #filtros consecutivos uno después del otro, es decir hace los 3 al mismo tiempo
   @expenses = @expenses.where("category_id = ?", params[:category_id]) if params[:category_id].present?    
   @expenses = @expenses.where("type_id = ?", params[:type_id]) if params[:type_id].present?
   @expenses = @expenses.where("concept LIKE ?", "%#{params[:q]}%") if params[:q].present?
   @expenses = date_param?(@expenses) #filtro por defecto que aparece al principio
   
   ## Este filtro sirve para cuando solo hay dos parmas de búsqueda, uno después del otro

   # if params[:category_id].present? && params[:type_id].present?
   #   @expenses = @expenses.where("category_id = ?", params[:category_id]).where("type_id = ?", params[:type_id]) #busca el id de categoria y de type
   # elsif params[:type_id].present?
   #   @expenses = @expenses.where("type_id = ?", params[:type_id]) #busca el id
   # elsif params[:category_id].present?
   #   @expenses = @expenses.where("category_id = ?", params[:category_id]) #busca el id
   # elsif params[:date].present?
   #   @expenses = @expenses.where("concept LIKE ?", "%#{params[:q]}%") if params[:q].present?
   #   @expenses = date_param?(@expenses) #busca por fecha
   # end

  @total = Expense.total(@expenses)
  @average = Expense.average(@expenses)

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

   private
  # se utiliza para filtrar por fecha del select
  def date_param?(expenses)
    if params[:date].present?
      begin_date = Date.strptime(params[:date], '%m-%Y')
      end_date = begin_date.end_of_month
      expenses = expenses.where(date: begin_date..end_date).order('date DESC')
    else
   # filtro de inicio por fecha actual
      expenses = expenses.where(date: Date.today.beginning_of_month..Date.today.end_of_month).order('date DESC') 
    end
  end

end
