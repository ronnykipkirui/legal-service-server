class AdvocatesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    def index
        lawyer = Advocate.all
        render json: lawyer, status: :ok 
    end

    def show
        lawyer = Advocate.find_by(id: session[:advocate_id])
        if lawyer
            render json: lawyer, status: :ok
        else 
            render json: {error: "unauthorized"}, status: :unauthorized
        end
    end

    def create
        lawyer = Advocate.create!(advocate_params)
        session[:advocate_id] = lawyer.id
        render json: lawyer, status: :created
    end

    private

    def advocate_params
        params.permit(:name, :phone,  :years_of_practice, :pin_number, :email, :password, :password_confirmation)
    end

    def render_record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_record_not_found(e)
        render json: {errors: e.record.errors.full_messages}, status: :not_found
    end


    

end
