class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(["code LIKE ?","%#{params[:search]}%"])
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # does the item already exist, if it does, increase quantity 
    @item = Item.where(code: item_params[:code]).first
    if !@item.nil?
      @item.update_attribute(:quantity, @item.quantity+1)
      redirect_to @item
    #otherwise create a new item
    else
      @item = Item.new(item_params)
      @item.quantity = 1
      respond_to do |format|
        if @item.save
          format.html { render :edit }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #form for checking out items only
  def checkout
    @item = Item.new
  end

  #checkout form redirects to this action. If barcode matches, decrease quantity
  def check_out
    @item = Item.where(code: item_params[:code]).first
    if @item.nil?
      redirect_to :checkout, notice: 'Item does not exist in inventory.'
    elsif @item.quantity == 0
      redirect_to checkout_url, notice: "Cannot checkout. Current quantity of #{@item.name} is 0."
    else
      @item.update_attribute(:quantity, @item.quantity-1)
      redirect_to items_url, notice: "#{@item.name} was successfully checked out."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:code, :name, :category, :price, :quantity)
    end
end
