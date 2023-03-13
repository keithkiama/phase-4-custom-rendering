class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: 'Cheese not found' }
    end
  end

  # # Option 2 GET
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: {
  #     id: cheese.id,
  #     name: cheese.name,
  #     price: cheese.price,
  #     is_best_seller: cheese.is_best_seller
  #   }
  # end
end
