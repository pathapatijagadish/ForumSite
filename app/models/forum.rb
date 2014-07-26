class Forum < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: [:slugged,:finders]
	
	has_many :topics, dependent: :destroy
	belongs_to :user
	
	validates :name,:description, :presence => true
	validates :name, :uniqueness => true
	validates :name, length: { minimum: 3 }	

	default_scope { includes(:topics)}
end
