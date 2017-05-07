class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy, :publish, :hide]

  def index
    @products = Product.includes(:photos).all
  end

  def new
    @product = Product.new
    @photo = @product.photos.build #for multi-pics
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      end
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:photos] != nil
      @product.photos.destroy_all

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def publish
    @product.publish!
    redirect_to :back
  end

  def hide
    @product.hide!
    redirect_to :back
  end

  private

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :body, :friendly_id, :category, :quantity, :price, :is_hidden, :image)
  end
end
