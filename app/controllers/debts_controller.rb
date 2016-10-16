class DebtsController < ApplicationController
  before_action :find_user

  def index
    @debts = Debt.where(user_id: @user.id).order(title: "ASC")
  end

  def show
    @debt = Debt.find(params[:id])
    @payments = @debt.payments
  end

  def new
    @debt = Debt.new
  end

  def create
    @debt = Debt.new(debt_params)
    @debt.set_user(@user)
    if @debt.save
      flash[:message] = "The new debt account was created successfully."
      redirect_to user_debt_path(@user, @debt)
    else
      flash[:message] = "An error occured while trying to create the new debt account."
      render "new"
    end
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:id])
    if @debt.update(debt_params)
      flash[:message] = "The new debt account was updated successfully."
      redirect_to user_debts_path
    else
      flash[:message] = "An error occured while trying to update the new debt account."
      render "edit"
    end
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy
    flash[:message] = "The debt account was deleted successfully."
    redirect_to user_debts_path
  end

  private
    def debt_params
      params.require(:debt).permit(:title, :initial_amount, :current_amount, :target_payoff_date)
    end

end