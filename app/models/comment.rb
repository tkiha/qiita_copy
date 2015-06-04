class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, inverse_of: :comments


  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :text, presence: true

  before_validation :set_comment_user_id

  after_create :add_alert

  private
  def set_comment_user_id
    self.user_id = self.article.comment_user.id
  end

  def add_alert
    Alert.create(user_id:      self.article.user_id,
                 from_user_id: self.user_id,
                 text:         "#{self.user.email}さんからコメントが付きました",
                 url:          Rails.application.routes.url_helpers.article_path(self.article))
  end

end
