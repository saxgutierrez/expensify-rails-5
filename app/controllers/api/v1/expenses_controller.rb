module Api
  module V1
    class ExpensesController < ApplicationController
     

      def index
        @expenses = Expense.all
        render json: @expenses
      end

      def create
        @expense = Expense.create!(expense_params)
        if @expense.save
          render json: @expense, status: 201
        else
          render json: {errors: @expense.errors}, status: 422
        end
        
      end

      def update
        @expense.update(params[:id],expense_params)
        if @expense.update(expense_params)
        render json: @expense, status: 200
        else
        render json: {errors: @expense.errors}, status: 422
        end
       
      end

      def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        if @expense.destroy
         render json: @expense, status: 204
         else
         head :no_content
         end
      end

      private

      def expense_params
        params.permit(:concept, :date, :amount, :category_id, :type_id)
      end

    end
  end
end