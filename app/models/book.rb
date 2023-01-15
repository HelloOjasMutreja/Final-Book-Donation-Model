class Book < ApplicationRecord
    validates :category_id, presence: true
    validates :title, presence: true, length: { minimum: 1, maximum: 50 }
    validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
    belongs_to :category
    belongs_to :user
    has_many :requests, dependent: :destroy
    has_one_attached :image, dependent: :destroy
    has_noticed_notifications model_name: "Notification"
    has_many :notifications, through: :user, dependent: :destroy

    def image_as_thumbnail
        return unless image.content_type.in?(%w[image/jpeg image/png])
            image.variant(resize_to_limit: [300,300]).processed
        end        
    end
