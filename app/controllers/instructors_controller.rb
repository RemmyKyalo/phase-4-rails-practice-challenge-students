class InstructorsController < ApplicationController
    def index 
    instructor = Instructor.all
    render json: instructor , status: :ok
    end

    def show
    instructor = Instructor.find(params[:id])
    if instructor
        render json: instructor , status: :ok
    else
        render json:{errors: instructor.errors.full_messages}, status: :not_found
    end
    end

    def  create
    instructor = Instructor.create(instructor_params)
    if instructor.valid?
        render json: instructor, status: :created
    else
        render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
    end
    end
    def update 
    instructor =  Instructor.find(params[:id])
    if instructor
    instructor.update(instructor_params)
    render json: instructor, status: :ok
    else
    render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
    end
    end

    def destroy
        instructor = Instructor.find(params[:id])
        if instructor 
        instructor.destroy
        head :no_content
        else
            render json: {errors: instructor.errors.full_messages}, status: :not_found
        end
            
        end
    

    private

    def instructor_params
        params.permit(:name)
    end
end
