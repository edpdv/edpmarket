class Content < ApplicationRecord
	belongs_to :user

	has_one_attached :cover
	has_one_attached :contenuto
end
