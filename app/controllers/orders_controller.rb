class OrdersController < ApplicationController
  before_action :login_required

  def new
    if params[:date].present?
      if params[:date].values==[""]
        redirect_to orders_path, notice: "希望日/希望時間を選択してください!!"
      else
        if params[:date].keys[0].to_datetime.to_i > params[:date].values[0].to_datetime.to_i-32400
          redirect_to orders_path, notice: "正しく希望日/希望時間を選択してください!!"
        end
      end
    end
  end

  def create   
    @date=params[:date]
    @address=params[:address]
    @delive_array=Array.new(Dish.last.id,0)
    @stock_array=Array.new(Dish.last.id,0)
    @sub_delive_array=Array.new(SubDish.last.id,0)
    @sub_stock_array=Array.new(SubDish.last.id,0)
    @customer = Customer.find(current_customer.id)

    @order=Order.new
    @order.customer_id=current_customer.id
    @order.reserve_date=Time.zone.now
    @order.deliver_date=@date
    @order.all_kcal=Cart.find(current_customer.id).all_kcal
    @order.sum_price=Cart.find(current_customer.id).sum_price

    if params[:address].to_i == 1
      @order.deliver_address = @customer.address
    elsif params[:address].to_i == 2
      @order.deliver_address = "店舗"
    end
    
    if @order.save
      Customer.find(current_customer.id).cart.bentos.each do |c|
        c.dish_ids.each do |d|
          @delive_array[d-1]+=c.num.to_i
          @stock_array[d-1]=Dish.find(d).stock.to_i
        end
      end
      for i in 0..@delive_array.length-1
        if @delive_array[i] > @stock_array[i]
          Order.find(@order.id).destroy
          redirect_to :carts, notice: "注文ミス!おかずの内容を確認して下さい!" and return
        end
      end

      @customer.cart.associations.each do |a|
        @sub_dish = a.sub_dish
        @id=@sub_dish.id
        @sub_delive_array[@id-1]+=a.num.to_i
        @sub_stock_array[@id-1]=SubDish.find(@id).stock.to_i
      end

      for i in 0..@sub_delive_array.length-1
        if @sub_delive_array[i] > @sub_stock_array[i]
          Order.find(@order.id).destroy
          redirect_to :carts, notice: "注文ミス!サイドメニューを確認して下さい!" and return
        end
      end

      for i in 0..@delive_array.length-1
        if @delive_array[i]!=0
          Dish.find(i+1).update(stock: @stock_array[i]-@delive_array[i])
        end
      end
      
      for i in 0..@sub_delive_array.length-1
        if @sub_delive_array[i]!=0
          SubDish.find(i+1).update(stock: @sub_stock_array[i]-@sub_delive_array[i])
        end
      end

      Customer.find(current_customer.id).cart.bentos.each do |b|
        @order_bento=OrderBento.new(order_id: @order.id)
        @order_bento.bento_id=b.id
        @order_bento.save
        Bento.find(b.id).update(cart_id: -1)
      end

      @customer.cart.associations.each do |a|
        @order_sub=OrderSubdish.new(order_id: @order.id)
        @order_sub.sub_dish_id=a.id
        @order_sub.save
        Association.find(a.id).update(cart_id: -1)
      end

      redirect_to :account, notice:  "注文完了!" and return
    end
  end
end
