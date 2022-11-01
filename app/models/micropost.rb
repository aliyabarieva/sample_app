class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  # validates :picture, content_type: { in: %w[image/jpeg image/gif image/png],
  #                                   message: "must be a valid image format" },
  #                                   size: { less_than: 5.megabytes,
  #                                   message: "should be less than 5MB" }
  def display_image
    picture.variant(resize_to_limit: [500, 500])
  end
  # private

    # # Проводит валидацию размера загруженного изображения.
    # def picture_size
    #   if picture.size > 5.megabytes
    #     errors.add(:picture, "should be less than 5MB")
    #   end
    # end
end