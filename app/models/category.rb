class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :books
end
