class Debt < ActiveRecord::Base
  belongs_to :user
  has_many :payments

  def set_user(user)
    self.user_id = user.id
  end

  def set_current_amount
    self.current_amount = (self.current_amount.to_f - self.payments.last.amount.to_f).to_s
    self.save
  end

  def reset_current_amount(payment)
    amount = payment.amount.to_f
    self.current_amount = (self.current_amount.to_f + amount).to_s
    self.save
  end

end
