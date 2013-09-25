class Order < ActiveRecord::Base
	belongs_to :seller
	has_many :products
	accepts_nested_attributes_for :products, allow_destroy: true
end
