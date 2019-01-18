class ReviewsController < ApplicationController
  before_filter :authorize
  
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      puts "review SAVED!!!!"
      redirect_to "/products/#{@product.id}"
    else
      puts "review NOT SAVED!!!!"
      redirect_to root_path
    end

  end
  
  private
  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end

# p= Product.find(49)
# r = p.reviews.build
# r = p.reviews.build(description: "coollllllllllll")