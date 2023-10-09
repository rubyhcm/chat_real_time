class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  validates :topic, presence: true, uniqueness: { case_sensitive: false }

  before_validation :sanitize_and_slugify_topic

  def to_param
    slug
  end

  private

  def sanitize_and_slugify_topic
    self.topic = topic.to_s.strip
    self.slug  = topic.downcase.gsub(" ", "-")
  end
end
