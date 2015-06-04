class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :to_user, class_name: :User, foreign_key: :to_user_id

  validates :user_id, presence: true
  validates :to_user_id, presence: true

end
