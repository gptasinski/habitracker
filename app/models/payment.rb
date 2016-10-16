class Payment < ActiveRecord::Base
  belongs_to :debt
  belongs_to :user

  def set_debt(debt)
    self.debt_id = debt.id
  end

  # def set_debt_current_amount(debt)
  #   amount = debt.current_amount
  #   change = self.amount
  #   debt.current_amount = amount - change
  #   @debt.save
  # end
end
