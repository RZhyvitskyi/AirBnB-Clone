class ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to demon_path(@review.demon), status: :see_other
  end

  def create
    @user = current_user
    @demon = Demon.find(params[:demon_id])
    @review = Review.new(**review_params)
    @review.user = @user
    @review.demon = @demon

    if @review.save
      redirect_to demon_path(@demon), notice: 'Demon was successfully created.'
    else
      redirect_to demon_path(@demon), alert: 'Demon was not created.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
