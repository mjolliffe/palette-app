class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
  @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course Added"
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(user_params)
      flash[:success] = "Course Updated"
      redirect_to @course
    else
      render 'edit'
    end
  end

private
  def course_params
    params.require(:course).permit(:name, :instructor, :street_address, :zip_code, :course_image_url, :sessions_per_course, :start_date, :end_date, :course_day_of_week, :description, :price, :user_id)
  end
end
