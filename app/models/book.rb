class Book < ApplicationRecord
    validates :category_id, presence: true
    validates :title, presence: true
    validates :image, presence: true
    belongs_to :category
    belongs_to :user
    has_one_attached :image, dependent: :destroy

    def image_as_thumbnail
        return unless image.content_type.in?(%w[image/jpeg image/png])
            image.variant(resize_to_limit: [300,300]).processed
        end        
    end
