class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with:  :render_record_invalid
    def create
        client = Client.create!(client_params)
        render json: client, status: :created
        
    end

    def show
        client = Client.find_by(id: params[:id] )
        render json: client, status: :ok
        
    end

    def index
        client = Client.all
        render json: client, status: :ok
        
    end



    private

    def client_params
        params.permit(:name, :email, :phone, :password, :password_confirmation)
    end


    def render_record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
        
    end

end
