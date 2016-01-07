class CoursesController < ApplicationController
  @@descending = false

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

  def index
    if params[:query] && params[:search]
      @paginate = false
      search_by = params[:search].to_sym
      query = params[:query]
      course_list = Course.all
      @courses = []
      course_list.each do |course|
        if course[search_by].to_s.downcase.include? params[:query].to_s.downcase
          @courses << course
        end
      end
    else
      @paginate = true
      @courses = Course.page(params[:page]).per(10).padding(0)
    end
  end

        # elsif params[:query]
        #   @courses = Course.where(:zip_code => params[:query])

  def show
    if params[:commit] == "next class"
        course = Course.find(params[:id].to_i + 1)
        redirect_to course_path(course)
    elsif params[:commit] == "prev class"
        course = Course.find(params[:id].to_i - 1)
        redirect_to course_path(course)
    else
        @course = Course.find(params[:id])
    end
  end

  def sort
    if @@descending
      @courses = Course.order(params[:order_by] + ' DESC')
      @@descending = false
    else
      @courses = Course.order(params[:order_by])
      @@descending = true
    end
    render :index
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

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def interested
    course = Course.find(params[:id])
    user = current_user
    flash[:success] = "I see you're interested."
    redirect_to courses_path
  end

  def enroll
    course = Course.find(params[:id])
    user = current_user
    if course.users.where(:id => user.id).any? #check if student is in course
        flash[:error] = "You are already enrolled in this course." #if student is in course then dont allow enrollment
        redirect_to courses_path
    else #if not signed up allow
        course.users << user
        flash[:success] = "Successfully Enrolled"
        redirect_to courses_path(course)
    end
  end

  def unenroll
    course = Course.find(params[:id])
    user = current_user
    if course.users.where(:id => user.id).any? #check if student is in course, if true:
      course.users.delete(user.id) #remove user id from course (remove item from ruby array)
      course.save #resave course
      flash[:success] = "Successfully Unenrolled"
    else #if student is not enrolled in the course
      flash[:error] = "You are not enrolled in this course."
    end
      redirect_to courses_path(course)
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
