class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, inverse_of: :article,  dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true
  has_many :stocks
  has_many :stock_users, through: :stocks, source: :user,  dependent: :destroy


  validates :user_id, presence: true
  validates :title, presence: true
  validates :text, presence: true

  acts_as_taggable

  attr_accessor :comment_user


  def self.followed(user)
    where("user_id IN (?)", user.follow_users.pluck(:id))
  end

  def self.stocked(user)
    where("id IN (?)", user.stock_articles.pluck(:id))
  end

  def self.followed_tag(user)
    tagged_with(user.follow_tags.pluck(:tag))
  end


  # private
  # def other_users_comment?
  #   return false if attributes[:user_id].blank?
  #   a = attributes[:user_id] != self.comment_user.id
  #   p "●#{a} #{attributes[:user_id]} #{self.comment_user.id} "
  #   a
  # end

end
