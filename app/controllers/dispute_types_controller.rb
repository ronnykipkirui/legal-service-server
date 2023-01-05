class DisputeTypesController < ApplicationController
    def index
        type = DisputeType.all
        render json: type, status: :ok
    end

    def create
        type = DisputeType.create!(dispute_category_id: params[:dispute_category_id], dispute_name: params[:dispute_name])
        render json: type, status: :created
    end
   
end
