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
      flash[:notice] = "You've successfully collected the skill!"
    else
      flash[:warning] = "You've already collected the skill!"
    end

    redirect_to product_path(@product)
  end

  def discollect
    if current_user.has_collected?(@product)
      current_user.discollect!(@product)
      flash[:alert] = "You've successfully discollected the skill!"
    else
      flash[:warning] = "You haven't collected the skill yet!"
    end

    redirect_to product_path(@product)
  end

  def upvote
    @product.upvote_by current_user
    redirect_to :back
  end

  def add_to_cart
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Successfully add #{@product.title} to cart!"
    else
      flash[:warning] = "You've already add it to cart!"
    end
    redirect_to :back
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
    desplay_products.where(:category => "rails")
  end

  def heroku
    desplay_products.where(:category => "heroku")
  end

  def frontend
    desplay_products.where(:category => "frontend")
  end

  def backend
    desplay_products.where(:category => "backend")
  end

  def others
    desplay_products.where(:category => "others")
  end

  private

  def find_product
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def desplay_products
    @products = Product.includes(:category, :photos).where(:is_hidden => false).order("id DESC").paginate(page: params[:page], per_page: 8)
  end
end
