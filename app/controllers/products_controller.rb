class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:collect, :discollect]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def collect
    @product = Product.find(params[:id])

    if !current_user.has_collected?(@product)
      current_user.collect!(@product)
      flash[:notice] = "You've successfully collected the skill!"
    else
      flash[:warning] = "You've already collected the skill!"
    end

    redirect_to product_path(@product)
  end

  def discollect
    @product = Product.find(params[:id])

    if current_user.has_collected?(@product)
      current_user.discollect!(@product)
      flash[:alert] = "You've successfully discollected the skill!"
    else
      flash[:warning] = "You haven't collected the skill yet!"
    end

    redirect_to product_path(@product)
  end

  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Successfully add #{@product.title} to cart!"
    else
      flash[:warning] = "You've already add it to cart!"
    end
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end

  def rails
    @products = Product.where(:category => "rails").paginate(:page => params[:page], :per_page => 5)
  end

  def heroku
    @products = Product.where(:category => "heroku").paginate(:page => params[:page], :per_page => 5)
  end

  def frontend
    @products = Product.where(:category => "frontend").paginate(:page => params[:page], :per_page => 5)
  end

  def backend
    @products = Product.where(:category => "backend").paginate(:page => params[:page], :per_page => 5)
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_or_description_or_body_cont => query_string }
  end

end
