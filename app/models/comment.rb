class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :reject_new_user

  def reject_new_user(attributes)
    attributes[:username].blank?
  end

end
