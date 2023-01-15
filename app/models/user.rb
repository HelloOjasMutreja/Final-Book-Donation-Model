class User < ApplicationRecord
  has_many :books
  has_many :requests, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attribute :user_name, :string

  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :user   
  end

end
