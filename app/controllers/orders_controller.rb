class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_seller!, only: [:index, :show, :edit, :update, :destroy, :log_in, :search]

layout "proxy", :only => :new

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.find(:all, :conditions => {:seller_id => current_seller.id, :export => false})
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @seller = Seller.find(:first, :conditions => { :store => params[:store] })
    @order = @seller.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_create_params)
    
    #render json: params[:order]

    respond_to do |format|
      if @order.save
        format.html { redirect_to welcome_path, notice: 'Order was successfully created.' }
         #render :layout => false
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_edit_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

    def welcome
    end

    def log_in
    end

    def search
      @orders = current_seller.orders.find_all{ |item| item.export == true && item.created_at.to_s >= params[:start_date] && item.created_at.to_s <= params[:end_date] }
      render :action => :history
    end

    def history
      @orders = current_seller.orders.find(:all, :conditions => {:export => true})
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_edit_params
      params.require(:order).permit(:export, :contact, :exchange_rate, :fare, :fee, :totalprice, :bank_name, :bank_account, products_attributes: [:id, :name, :description, :success, :count, :spot, :janpan_price, :taiwan_price, :_destroy ])
    end

    def order_create_params
      params.require(:order).permit(:export, :seller_id, :contact, products_attributes: [ :id, :name, :description, :_destroy])
    end
end
