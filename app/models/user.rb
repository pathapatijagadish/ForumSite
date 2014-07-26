class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged,:finders]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name ,presence: true
  validates :name, length: { minimum: 3 }

  def to_s
  	name.to_s
  end
end
