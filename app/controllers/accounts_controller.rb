class AccountsController < ApplicationController
  def show
    @customer= current_customer
  end

  def edit
    @customer= current_customer
  end

  def new
    @customer = Customer.new()
  end

  def create
    puts "increate action"
    @customer=Customer.new(params[:customer])
    puts "after_customer_new"
    if @customer.save
      puts "save"
      cookies.signed[:customer_id]={value: @customer.id}
      puts "cookie"
      @cart=Cart.create(customer_id: @customer.id)
      puts "cart_create"
      redirect_to :root, notice: "会員登録が完了しました。"
    else
      render "/customers/new"
    end
  end

  def update
    @customer=current_customer
    @customer.assign_attributes(params[:account])
    if @customer.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    Cart.find(current_customer.id).destroy
    current_customer.destroy
    redirect_to :root, notice: "退会しました"
  end
end
