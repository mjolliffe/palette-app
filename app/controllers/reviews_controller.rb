class ReviewsController < ApplicationController
  before_action :current_user, only: [:create, :destroy, :new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Review Added"
      redirect_to :back
    else
      flash.now[:danger] = "Error"
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review Updated"
      redirect_to :back
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:content, :user_id, :course_id)
    end

#   def show
#     @user = Review.find(params[:id])
#   en

#   def destroy
#     @review = Review.find(params[:id])
#     @review.destroy
#     redirect_to course_reviews_path
#   end


end
