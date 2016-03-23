class ItemsController < ApplicationController
  include BbInventoryHelpers::Cart
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    create_cart
    #@items = Item.all.paginate(:page => params[:page]).per_page(10)
    @gender_list = Item::GENDER_LIST.to_h
    @age_list = Item::AGE_LIST.to_h 
    @filterrific = initialize_filterrific(Item, params[:filterrific],
      select_options: { for_category: Category.alphabetical.all.map(&:name),
                        by_age: ['0-2', '3-10', '11-21'] },
    ) or return
    @items = @filterrific.find.paginate(:page=>params[:page]).per_page(5)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @gender_list = Item::GENDER_LIST.to_h
    @age_list = Item::AGE_LIST.to_h 
  end

  # GET /items/new
  def new
    # @item = Item.new
    # @bcode = params[:barcode]
    # i = Item.where("barcode = ?", @bcode)
    # if (i!=nil):
    redirect_to get_new_barcode_path
  end

  # NEW ITEM -> BARCODE -> FORM -> SAVE ITEM

  def get_new_barcode
    # @item = Item.new
    # redirect_to get_new_item_info_path(@item)
  end

  def get_new_item_info
    barcode = params[:barcode]
    @item = Item.find_by barcode: barcode 
    if @item.nil?
      @item = Item.new
      @item.barcode = barcode
    end
    @categories = Category.alphabetical
    # barcode = params[:barcode]
    # @item = Item.where("barcode=?", @bcode)
    # redirect_to action: "new", barcode: @bcode
    render 'new'
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    quantity_increase = item_params[:quantity].to_i
    previous_quantity = @item.quantity
    respond_to do |format|
      if @item.update(item_params)
        @item.quantity = previous_quantity + quantity_increase
        @item.save 
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:barcode, :quantity, :name, :gender, :age, :donated, :notes, :category_id)
    end
end
