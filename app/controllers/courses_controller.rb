class CoursesController < ApplicationController
  # code below is used to set the sort status
  @@descending = false

  # creates a new course
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

  # adds kaminari paginator
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

  # shows individual classes as well as adds kaminari pagination to class pages
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

  # sorts classes on main class page
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

  # selects which class to edit and allows params to be updated
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

  # selects the current user based on the id of the session and the id of the user; they should match
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # wanted to implement the below so that the user could select that they were interested in the course but maybe enroll at a later date
  # def interested
  #   course = Course.find(params[:id])
  #   user = current_user
  #   flash[:success] = "I see you're interested."
  #   redirect_to courses_path
  # end

  # allows the user to enroll in a course; addes the user to the course users database
  def enroll
    course = Course.find(params[:id])
    user = current_user
    if course.users.where(:id => user.id).any? #check if student is in course
        flash[:danger] = "You are already enrolled in this course." #if student is in course then dont allow enrollment
        redirect_to courses_path
    else #if not signed up allow
        course.users << user
        flash[:success] = "Successfully Enrolled"
        redirect_to courses_path(course)
    end
  end

  # allows the user to unenroll from the course by deleting the users id from the course database
  def unenroll
    course = Course.find(params[:id])
    user = current_user
    if course.users.where(:id => user.id).any? #check if student is in course, if true:
      course.users.delete(user.id) #remove user id from course (remove item from ruby array)
      course.save #resave course
      flash[:success] = "Successfully Unenrolled"
    else #if student is not enrolled in the course
      flash[:danger] = "You are not enrolled in this course."
    end
      redirect_to courses_path(course)
  end

  # deletes a course
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

private
  # defines the params that are particulare to creating a course; these are defined by the schema which was created when the course model was created
  def course_params
    params.require(:course).permit(:name, :instructor, :street_address, :zip_code, :course_image_url, :sessions_per_course, :start_date, :end_date, :course_day_of_week, :description, :price, :creator_id)
  end
end
