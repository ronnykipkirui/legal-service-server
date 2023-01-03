class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

  # Only logged in Advocates have authorization 
  def index
    advocate = Advocate.find_by(id: session[:advocate_id])
    if advocate
      clients = Client.all
      render json: clients, status: :ok
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def create
    client = Client.create!(client_params)
    session[:client_id] = client.id
    render json: client, status: :created
  end

  def show
    client = Client.find_by(id: session[:client_id])
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :client_id
      render json: client, status: :ok, serializer: ClientMeSerializer
  end

  private

  def client_params
    params.permit(:email, :phone, :name, :password, :password_confirmation)
  end

  def render_record_invalid_response(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
