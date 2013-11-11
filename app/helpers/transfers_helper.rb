module TransfersHelper

  def render_receiver_name(transfer)
    User.where(id: transfer.receiver_id).first.name
  end
end