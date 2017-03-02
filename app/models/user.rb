class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :alfred_modules, dependent: :destroy

  validates_presence_of :username

  validates :username, uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 30 },
                       format: /\A[a-z0-9\-_]+\Z/, allow_blank: true
end
