class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :image, content_type: {in: %w[image/jpeg image/gif image/png],
                                   create: "must be a valid image format"},
            size: {less_than: 5.megabytes, create: "should be less tha 5MB"}
end
