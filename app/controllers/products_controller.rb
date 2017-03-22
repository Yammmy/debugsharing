class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:collect, :discollect]
  before_action :find_product, only: [:show, :collect, :discollect, :upvote, :add_to_cart]

  def index
    @products = Product.includes(:photos).where(:is_hidden => false).order("id DESC").paginate(page: params[:page], per_page: 8)
  end

  def show
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
      @products = Product.includes(:photos).where(:is_hidden => false).search(params[:search], fields:["title", "description"])
    else
      @products = Product.includes(:photos).where(:is_hidden => false).order("id DESC").paginate(page: params[:page], per_page: 8)
      flash[:alert] = "Opps! No skills matched yet, welcome see all the skills below."
    end
  end

  def autocomplete
    render json: Product.search(params[:term], fields: [{title: :text_start}]).map(&:title)
  end

  def rails
    @products = Product.includes(:photos).where(:is_hidden => false, :category => "rails").paginate(:page => params[:page], :per_page => 8)
  end

  def heroku
    @products = Product.includes(:photos).where(:is_hidden => false, :category => "heroku").paginate(:page => params[:page], :per_page => 8)
  end

  def frontend
    @products = Product.includes(:photos).where(:is_hidden => false, :category => "frontend").paginate(:page => params[:page], :per_page => 8)
  end

  def backend
    @products = Product.includes(:photos).where(:is_hidden => false, :category => "backend").paginate(:page => params[:page], :per_page => 8)
  end

  def others
    @products = Product.includes(:photos).where(:is_hidden => false, :category => "others").paginate(:page => params[:page], :per_page => 8)
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
