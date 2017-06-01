class Song < ApplicationRecord

	validates :title, :artist, presence: true, length: {minimum: 2},:on => :create

	has_many :users
	has_many :lists

end
