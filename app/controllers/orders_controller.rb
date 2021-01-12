class OrdersController < ApplicationController
  before_action :login_required
  def index
    @order=Order.find(current_customer.id)
  end

  def new
    if params[:date].present?
      if params[:date].values==[""]
        redirect_to orders_path, notice: "希望日/希望時間を選択してください!!"
      else
        if params[:date].keys[0].to_datetime > params[:date].values[0].to_datetime
          redirect_to orders_path, notice: "正しく希望日/希望時間を選択してください!!"
        end
      end
    end
  end

  def create
    @date=params[:date]
    @address=params[:address]
    @order=Order.new
    @order.customer_id=current_customer.id
    @order.reserve_date=Time.zone.now
    @order.deliver_date=@date.first.first
    if @address.to_i==1
      @order.deliver_address=Customer.find(current_customer.id).address
    end
    if @address.to_i==2
      @order.deliver_address="店舗"
    end
    if @order.save
      Customer.find(current_customer.id).cart.bentos.each do |c|
        @num=c.num.to_i
        c.dish_ids.each do |d|
          for i in 1..@num do
            @sto=Dish.find(d).stock.to_i
            @mem=@sto-1
            #注文ミスのときに在庫をもとに戻す
            if @mem > 0
              Dish.find(d).update(stock: @mem)
            elsif  @mem <= 0 && i!=@num
              redirect_to :root, notice: "注文ミス!" and return
            end
          end
        end
        #注文確定のときに在庫を反映させる
        redirect_to :root, notice:  "注文完了!" and return
      end
    end
  end
end
