class ProductsController < ApplicationController
  before_action :get_product, only: [:description, :inventory]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(products_params)
    redirect_to products_path
  end

  def show
  end

  def description
    render plain: @product.description
  end

  def inventory
    @product.inventory > 0 ? (render plain: "true") : (render plain: "false")
  end

  private

  def get_product
    @product = Product.find_by(id: params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
