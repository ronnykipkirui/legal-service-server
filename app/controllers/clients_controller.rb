class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with:  :render_record_invalid

    def create
        client = Client.create!(client_params)
        session[:client_id] = client.id
        render json: client, status: :created
        
    end

    def show
        client = Client.find_by(id: session[:client_id])
        if client
        render json: client, status: :ok
        else 
            render json: {error: "unauthorized"}, status: :unauthorized
        
       end
        
    end

    # should add authorization only for advocates
    def index
        advocate = Advocate.find_by(id: session[:advocate_id])
        if advocate
        client = Client.all
        
        render json: client, status: :ok
        else
            render json: {error: "unauthorized"}, status: :unauthorized
        end
    end



    private

    def client_params
        params.permit(:name, :email, :phone, :password, :password_confirmation)
    end


    def render_record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
        
    end

end
