class Item < ApplicationRecord
	attachment :image
		belongs_to :genre, optional: true
	validates :name,presence:true
end
