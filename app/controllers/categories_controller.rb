class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.alphabetical
  end

  def show
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	respond_to do |format|
    	if @category.save
        format.html { redirect_to categories_url }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_category
  	  @category = Category.find(params[:id])
    end

    def category_params
  	  params.require(:category).permit(:name)
    end
end
