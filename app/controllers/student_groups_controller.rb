class StudentGroupsController < ApplicationController
  before_action :set_student_group, only: [:show, :edit, :update, :destroy]

  def index
    @student_groups = StudentGroup.all
  end

#  GET /student_groups/1.json
  def show
    @student_groups = StudentGroup.find(params[:id])
  end

  def new
    if params[:back]
      @student_group = StudentGroup.new(student_group_params)
	else 
	  @student_group = StudentGroup.new
	end
  end

  def edit
  end

  def create
    @student_group = StudentGroup.new(student_group_params)

    respond_to do |format|
      if @student_group.save
        format.html { redirect_to @student_group, notice: 'Student group was successfully created.' }
        format.json { render :show, status: :created, location: @student_group }
      else
        format.html { render :new }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_group.update(student_group_params)
        format.html { redirect_to @student_group, notice: 'Student group was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_group }
      else
        format.html { render :edit }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student_group.destroy
    respond_to do |format|
      format.html { redirect_to student_groups_url, notice: 'Student group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_student_group
      @student_group = StudentGroup.find(params[:id])
    end

    def student_group_params
      params.require(:student_group).permit(:year, :month, :year_month, :date, :course_name)
    end
end
