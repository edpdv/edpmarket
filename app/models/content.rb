class Content < ApplicationRecord
	belongs_to :user

	has_one_attached :cover
	has_one_attached :contenuto

	validates :titolo, :descrizione, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :cover, presence: true
	validates :contenuto, presence: true

end
