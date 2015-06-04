class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles,  dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :alerts,  dependent: :destroy
  has_many :stocks
  has_many :stock_articles, through: :stocks, source: :article,  dependent: :destroy
  has_many :follows,  dependent: :destroy
  has_many :follow_users, through: :follows, source: :to_user,  dependent: :destroy

  has_many :followers,  class_name: :Follow, foreign_key: :to_user_id
  has_many :follower_users, through: :followers, source: :user,  dependent: :destroy

  has_many :follow_tags



  def article_stock?(article)
    self.stocks.find_by(article_id: article.id)
  end

  def follow_user?(to_user)
    self.follows.find_by(to_user_id: to_user.id)
  end

  def follow_tag?(tag_text)
    self.follow_tags.find_by(tag: tag_text)
  end

  def feed
    ids = [].concat(Article.followed(self).pluck(:id)).concat(Article.followed_tag(self).pluck(:id)).concat(Article.stocked(self).pluck(:id))
    Article.where("id IN (?)", ids).order("created_at desc")
  end


end
