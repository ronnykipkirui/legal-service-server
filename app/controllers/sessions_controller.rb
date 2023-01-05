class SessionsController < ApplicationController

  def client_login_session
    client = Client.find_by(email: params[:email])
    if client&.authenticate(params[:password])
      session[:client_id] = client.id
      render json: client, status: :ok
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def advocate_login_session
    advocate = Advocate.find_by(email: params[:email])
      if advocate&.authenticate(params[:password])
        session[:advocate_id] = advocate.id
        puts "Session is set #{session[:advocate_id]}"
        render json: advocate, status: :created
      else
        render json: {errors: ["Invalid username or password"]}, status: :unauthorized
      end
  end
  
  def client_destroy_session
    return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :client_id
    session.delete :client_id
    render json: {}, status: :no_content
  end


  def advocate_destroy_session
    return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :advocate_id
    session.delete :advocate_id
    render json: {}, status: :no_content
  end

end
