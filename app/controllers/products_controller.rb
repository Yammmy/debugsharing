class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
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

  def dresses
    @products = Product.where(:category => "dresses").paginate(:page => params[:page], :per_page => 5)
  end

  def jeans
    @products = Product.where(:category => "jeans").paginate(:page => params[:page], :per_page => 5)
  end

  def skirts
    @products = Product.where(:category => "skirts").paginate(:page => params[:page], :per_page => 5)
  end

  def shorts
    @products = Product.where(:category => "shorts").paginate(:page => params[:page], :per_page => 5)
  end

  def suits
    @products = Product.where(:category => "suits").paginate(:page => params[:page], :per_page => 5)
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_or_description_cont => query_string }
  end

end
