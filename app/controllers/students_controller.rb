class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_student, only: [:show, :update, :destroy]

      def index
        @students = Student.all
        render json: @students
      end

      def show
        render json: @student
      end

      def create
        @student = Student.new(student_params)
        if @student.save
          render json: @student, status: :created
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end

      def update
        if @student.update(student_params)
          render json: @student
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @student.destroy
      end

      private

      def set_student
        @student = Student.find(params[:id])
      end

      def student_params
        params.require(:student).permit(:name, :rollnumber, :standard, :date_of_birth)
      end
end
