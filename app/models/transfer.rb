class Transfer < ActiveRecord::Base
  validates_presence_of :receiver_id, :amount, :email, :name

  scope :performed, -> (user) { where(user_id: user.id) }
  scope :received, -> (user) { where(receiver_id: user.id) }
end