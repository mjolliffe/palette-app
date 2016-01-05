class CoursesController < ApplicationController
  @@descending = false

  # def index
  #   @courses = Course.all
  # end

  def index
    if params[:query] && params[:search]
      @paginate = false
      search_by = params[:search].to_sym
      query = params[:query]
      course_list = Course.all
      @courses = []
      course_list.each do |course|
        if course[search_by].downcase.include? params[:query].downcase
            @courses << course
        end
      end
    else
      @paginate = true
      @courses = Course.page(params[:page]).per(5).padding(0)
    end
  end

  # def show
  #   @course = Course.find(params[:id])
  # end

  def show
      if params[:commit] == "Next"
          course = Course.find(params[:id].to_i + 1)
          redirect_to course_path(course)
      elsif params[:commit] == "Prev"
          course = Course.find(params[:id].to_i - 1)
          redirect_to course_path(course)
      else
          @course = Course.find(params[:id])
      end
  end

  def sort
    if @@descending
      @courses = Course.order(params[:order_by] + 'DESC')
      @@descending = false
    else
      @courses = Course.order(params[:order_by])
      @@descending = true
    end
    render :index
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
    if @course.update_attributes(course_params)
      flash[:success] = "Course Updated"
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

private
  def course_params
    params.require(:course).permit(:name, :instructor, :street_address, :zip_code, :course_image_url, :sessions_per_course, :start_date, :end_date, :course_day_of_week, :description, :price, :creator_id)
  end
end
