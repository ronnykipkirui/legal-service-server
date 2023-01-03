class DisputeCategoriesController < ApplicationController
    def index
        cat = DisputeCategory.all
        render json: cat, status: :ok
    end

    def create
        cat = DisputeCategory.create(category_name: params[:category_name])
        render json: cat, status: :created
    end

end
