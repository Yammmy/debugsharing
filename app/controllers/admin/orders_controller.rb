class Admin::OrdersController < AdminController
  before_action :find_order, except: [:index]

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result.includes(:user).order("id DESC")


    if params[:ids].present?
      @orders = @orders.where( :id => params[:ids].split(",") )
    end

    if params[:date].present?
      date = Date.parse(params[:date])
      #@orders = @orders.where("created_at >= ? and created_at <= ?", date.beginning_of_day, date.end_of_day)
      @orders = @orders.where( :created_at => date.beginning_of_day..date.end_of_day)
    end

    @orders = @orders.paginate(page: params[:page])

    @label = (Date.today-10.day..Date.today).to_a
    @data = @label.map{ |date|
      Order.where( "created_at >= ? AND created_at < ?", date.beginning_of_day, date.end_of_day ).count
    }

    status_colors = { "order_placed" => "#FF6384",
                      "paid" => "#36A2EB",
                      "shipping" => "#ffe128",
                      "shipped" => "#4ce341",
                      "order_cancelled" => "#252525",
                      "good_returned" => "#002935"}

    colors = ['rgba(255, 99, 132, 0.2)',
               'rgba(54, 162, 235, 0.2)',
               'rgba(255, 206, 86, 0.2)',
               'rgba(75, 192, 192, 0.2)',
               'rgba(153, 102, 255, 0.2)',
               'rgba(255, 159, 64, 0.2)'
               ]

    dates = (Date.today-10.day..Date.today).to_a

    @data2 = {
      labels: dates,
      datasets: [
        {
          :label => "order count in recently 10 days",
          :data => dates.map { |date|
            @orders.where( "created_at >= ? AND created_at < ?", date.beginning_of_day, date.end_of_day ).count
          },
          backgroundColor: colors,
          borderWidth: 1
        }
      ]
    }
  end

  def show
    @product_lists = @order.product_lists
  end

  def ship
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order.cancell_order!
    OrderMailer.notify_cancell(@order).deliver!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
