class PaymentsController < ApplicationController
  before_action :find_user
  def index
    @debt = Debt.find(params[:debt_id])
    @payments = @debt.payments
  end

  def new
    @debt = Debt.find(params[:debt_id])
    @payment = Payment.new
  end

  def create
    @debt = Debt.find(params[:debt_id])
    @payment = Payment.new(payment_params)
    @payment.set_debt(@debt)
    if @payment.save
      @payment.debt.set_current_amount
      flash[:message] = "The new payment was created successfully."
      redirect_to user_debt_path(@user, @debt)
    else
      flash[:message] = "An error occured while trying to create the payment."
      render "new"
    end
  end

  def edit
    @debt = Debt.find(params[:debt_id])
    @payment = Payment.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:debt_id])
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      @payment.debt.set_current_amount
      flash[:message] = "The new payment was updated successfully."
      redirect_to user_debt_path(@user, @debt)
    else
      flash[:message] = "An error occured while trying to update the payment."
      render "edit"
    end
  end

  def destroy
    @debt = Debt.find(params[:debt_id])
    @payment = Payment.find(params[:id])
    @debt.reset_current_amount(@payment)
    @payment.destroy
    redirect_to user_debt_path(@user, @debt)
  end

  private
    def payment_params
      params.require(:payment).permit(:amount, :date, :description )
    end

end