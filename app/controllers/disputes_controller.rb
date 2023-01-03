class DisputesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

     def create
        disp = Dispute.create!(dispute_params)
        render json: disp, status: :created
     end

     def index
        disp = Dispute.all 
        render json: disp, status: :ok
     end

     def show
        disp = Dispute.find_by(id: params[:id])
        render json: disp, status: :ok
     end

     def destroy
        disp = Dispute.find_by(id: params[:id])
        if disp
         disp.delete
         head :no_content
        else
         render json: { error: "Record not found" }, status: :not_found
        end
     end

     def update
      advocate = Advocate.find_by(id: session[:advocate_id])
      if advocate
         dispute = Dispute.find_by(id: params[:id])
         dispute.update!(dispute_update_params)
         render json: dispute, status: :accepted
      else
         render json: { error: "Not authorized" }, status: :unauthorized
      end
   end


     private

     def dispute_params
        params.permit(:client_id, :advocate_id, :dispute_category_id, :dispute_info)
        
     end

     def render_invalid(e)
        render json:  {errors: e.record.errors.full_messages}, status: :unprocessable_entity
     end

     def render_not_found(e)
        render json:  {errors: e.record.errors.full_messages}, status: :not_found
     end

     def dispute_update_params
      params.permit(:dispute_info)
     end
end
