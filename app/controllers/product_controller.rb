class ProductController < ApplicationController

	def buy
		@product = Product.new(product_params)

			respond_to do |format|
				if @product.save
					format.html { render @products, notice: 'Product was successfully added.'}
				else
					format.html { redirect_to @product, notice: 'Failed to added.'}
				end
			end
		@products = Product.all

	end

		private

		def product_params
			params.permit(:name, :description)
		end
end
