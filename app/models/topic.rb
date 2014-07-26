class Topic < ActiveRecord::Base
	acts_as_taggable
  	acts_as_taggable_on :tags
	
	extend FriendlyId
  	friendly_id :name, use: [:slugged,:finders]

	belongs_to :forum
	belongs_to :user
	has_many :comments,dependent: :destroy	

	validates :name,:description, :presence => true
	validates :name, length: { minimum: 5 }
	validates :description, length: { minimum: 300 }
end
