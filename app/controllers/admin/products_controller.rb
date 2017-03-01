class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin'

  def index
    @products = Product.all
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

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
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to products_path
  end

  def publish
    @product = Product.find(params[:id])
    @product.publish!

    redirect_to :back
  end

  def hide
    @product = Product.find(params[:id])

    @product.hide!

    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :body, :category, :quantity, :price, :is_hidden, [:image])
  end
end
