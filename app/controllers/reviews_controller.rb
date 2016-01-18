class ReviewsController < ApplicationController
  # code below only allows the current user to create, edit or destroy the reviews they create
  before_action :current_user, only: [:create, :destroy, :new, :edit]

  # allows for the user to add a review to a course
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

  # allows for the user to edit/update a review for a course
  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review Updated"
      redirect_to course_path(Course.find_by(:id => @review.course_id))
    else
      render 'edit'
    end
  end

  # allows for the user to delete a review
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private
    def review_params
  # defines the params for a review
      params.require(:review).permit(:content, :user_id, :course_id)
    end
end
