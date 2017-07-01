class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:collect, :discollect]
  before_action :find_product, only: [:show, :collect, :discollect, :upvote, :add_to_cart]

  def index
    desplay_products
  end

  def show
    set_page_title @product.title
    set_page_description @product.description
    set_page_image @product.image_url
    @photos = @product.photos.all
    if @product.is_hidden
      flash[:warning] = "This product has already been archieved"
      redirect_to root_path
    end
  end

  def collect
    if !current_user.has_collected?(@product)
      current_user.collect!(@product)
      @notice = "You have successfully collected the skill!"
    else
      @warning = "You have already collected the skill!"
    end

    # redirect_to product_path(@product)
  end

  def discollect
    if current_user.has_collected?(@product)
      current_user.discollect!(@product)
      @notice = "You have successfully discollected the skill!"
    else
      @warning = "You have not collected the skill yet!"
    end

    # redirect_to product_path(@product)
    render "collect"
  end

  def upvote
    @product.upvote_by current_user
    # redirect_to :back
  end

  def add_to_cart
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      @notice = "Successfully add #{@product.title} to cart!"
    else
      @warning = "You have already add #{@product.title} to cart!"
    end
    # redirect_to :back
  end

  def search
    if params[:search].present?
      @products = Product.includes(:category, :photos).where(:is_hidden => false).search(params[:search], fields:["title", "description"])
    else
      desplay_products
      flash[:alert] = "Opps! No skills matched yet, welcome see all the skills below."
    end
  end

  def autocomplete
    render json: Product.search(params[:term], fields: [{title: :text_start}]).map(&:title)
  end

  def rails
    @products = Product.includes(:category, :photos).where(:is_hidden => false, :category_id => 1).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  def heroku
    @products = Product.includes(:category, :photos).where(:is_hidden => false, :category_id => 2).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  def frontend
    @products = Product.includes(:category, :photos).where(:is_hidden => false, :category_id => 3).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  def backend
    @products = Product.includes(:category, :photos).where(:is_hidden => false, :category_id => 4).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  def others
    @products = Product.includes(:category, :photos).where(:is_hidden => false, :category_id => 5).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  private

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def desplay_products
    @products = Product.includes(:category, :photos).where(:is_hidden => false).order("id DESC").paginate(page: params[:page], per_page: 8)
  end
end
