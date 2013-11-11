class Transfer < ActiveRecord::Base
  validates_presence_of :receiver_id, :amount, :email, :name
end