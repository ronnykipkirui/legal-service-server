class SessionsController < ApplicationController

    def client_session
      client = Client.find_by(email: params[:email])
     if client&.authenticate(params[:password])
      session[:client_id] = client.id
      render json: client, status: :ok
     else
      render json: {errors: ["Invalid username or password"]}, status: :unauthorized
     end
     
     end
    
    


    def advocate_session
      puts "hit"
        lawyer = Advocate.find_by(email: params[:email])
       if lawyer&.authenticate(params[:password])
        session[:advocate_id] = lawyer.id
        render json: lawyer, status: :ok
       else
        render json: {errors: ["Invalid username or password"]}, status: :unauthorized
       end
       
    end
  
  def client_destroy
    return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :client_id
    session.delete :client_id
    render json: {}, status: :no_content
  end


  def advocate_destroy
    return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :advocate_id
    session.delete :advocate_id
    render json: {}, status: :no_content
  end

  end 