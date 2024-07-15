class MarksController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_student, only: [:index, :create, :update, :destroy]
  # before_action :set_mark, only: [:show, :update, :destroy]

  # def index
  #   @marks = @student.marks
  #   render json: @marks
  # end

  # def show
  #   render json: @mark
  # end

  # def create
  #   @mark = @student.marks.new(mark_params)
  #   if @mark.save
  #     render json: @mark, status: :created
  #   else
  #     render json: @mark.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @mark.update(mark_params)
  #     render json: @mark
  #   else
  #     render json: @mark.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @mark.destroy
  #   head :no_content
  # end

  # private

  # def set_student
  #   @student = Student.find_by(id: params[:student_id])
  # end

  # def set_mark
  #   byebug
  #   # @mark = @student.marks.find(id: params[:id])
  #   @mark = Mark.find(params[:id])
  # end

  # def mark_params
  #   params.require(:mark).permit(:subject, :score, :grade, :student_id)
  # end

  # def index
  #   student = Student.find_by(id: params[:student_id])
  #   if student
  #     marks = student.marks
  #     render json: marks
  #   else
  #     render json: { error: 'Student not found' }, status: :not_found
  #   end
  # end

  # def show
  #   student = Student.find_by(id: params[:student_id])
  #   if student
  #     mark = student.marks.find_by(id: params[:id])
  #     if mark
  #       render json: mark
  #     else
  #       render json: { error: 'Mark not found' }, status: :not_found
  #     end
  #   else
  #     render json: { error: 'Student not found' }, status: :not_found
  #   end
  # end

  # # def create
  # #   byebug
  # #   # puts "Params: #{params.inspect}"
  # #   student = Student.find_by(params[:student_id])
  # #   if student
  # #     mark = student.marks.new(mark_params)
  # #     if mark.save
  # #       render json: mark, status: :created
  # #     else
  # #       render json: mark.errors, status: :unprocessable_entity
  # #     end
  # #   else
  # #     render json: { error: 'Student not found' }, status: :not_found
  # #   end
  # # end

  # def create
  #   byebug
  #   begin
  #     student = Student.find(params[:student_id])
  #     mark = student.marks.new(mark_params)
  #     if mark.save
  #       render json: mark, status: :created
  #     else
  #       render json: mark.errors, status: :unprocessable_entity
  #     end
  #   rescue ActiveRecord::RecordNotFound => e
  #     render json: { error: "Student not found" }, status: :not_found
  #   end
  # end

  # def update
  #   student = Student.find_by(id: params[:student_id])
  #   if student
  #     mark = student.marks.find_by(id: params[:id])
  #     if mark
  #       if mark.update(mark_params)
  #         render json: mark
  #       else
  #         render json: mark.errors, status: :unprocessable_entity
  #       end
  #     else
  #       render json: { error: 'Mark not found' }, status: :not_found
  #     end
  #   else
  #     render json: { error: 'Student not found' }, status: :not_found
  #   end
  # end

  # def destroy
  #   student = Student.find_by(id: params[:student_id])
  #   if student
  #     mark = student.marks.find_by(id: params[:id])
  #     if mark
  #       mark.destroy
  #       head :no_content
  #     else
  #       render json: { error: 'Mark not found' }, status: :not_found
  #     end
  #   else
  #     render json: { error: 'Student not found' }, status: :not_found
  #   end
  # end

  # private

  # def mark_params
  #   params.require(:mark).permit(:subject, :score, :grade).merge(student_id: params[:student_id])
  # end


    before_action :set_mark, only: [ :update, :destroy]

    def index
      @marks = Mark.all
      render json: @marks
    end

    def show
      @mark = Mark.find_by(id:params[:id])
      render json: @mark
    end


    def create
      @mark = Mark.new(mark_params)
      if @mark.save
        render json: @mark, status: :created
      else
        render json: @mark.errors, status: :unprocessable_entity
      end
    end

    def update
      if @mark.update(mark_params)
        render json: @mark
      else
        render json: @mark.errors, status: :unprocessable_entity
      end
    end


    def destroy
      @mark.destroy
    end

    private


    def set_mark
      @mark = Mark.find(params[:id])
    end

    def mark_params
      params.require(:mark).permit(:subject, :score, :grade, :student_id)
    end


end
