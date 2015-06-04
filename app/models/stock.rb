class Stock < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
  validates :article_id, presence: true

  after_create :add_alert

  private
  def add_alert
    Alert.create(user_id:      self.article.user_id,
                 from_user_id: self.user_id,
                 text:         "#{self.user.email}さんにストックされました",
                 url:          Rails.application.routes.url_helpers.article_path(self.article))
  end

end
