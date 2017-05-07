class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy, :publish, :hide]

  def index
    @products = Product.includes(:category, :photos).all
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
      redirect_to admin_products_path, notice: "Successfully add #{@product.title}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.category_id = params[:category_id]
    if params[:photos] != nil
      @product.photos.destroy_all

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
      redirect_to admin_products_path, alert: "Successfully update #{@product.title}"

    elsif @product.update(product_params)
      redirect_to admin_products_path, alert: "Successfully update #{@product.title}"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
    flash[:warning] = "Successfully delete #{@product.title}"
  end

  def publish
    @product.publish!
    redirect_to :back, alert: "Successfully publish #{@product.title}"
  end

  def hide
    @product.hide!
    redirect_to :back, alert: "Successfully hide #{@product.title}"
  end

  def bulk_update
    total = 0
    Array(params[:ids]).each do |product_id|
      product = Product.find(product_id)
      if params[:commit] == I18n.t(:bulk_update)
        if product.save
          total += 1
          flash[:alert] = "Successfully update #{total} products."
        end
      elsif params[:commit] == I18n.t(:bulk_delete)
        product.destroy
        total += 1
        flash[:alert] = "Successfully delete #{total} products."
      end
    end
    redirect_to admin_products_path
  end

  private

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :body, :friendly_id, :category_id, :quantity, :price, :is_hidden, :image)
  end
end
