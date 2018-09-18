class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @foods = Food.all
  end

  def show
   @food = Food.find(params[:id])
  end

  def new
   @food = current_user.foods.new
  end

  def create
    @food = current_user.foods.build(food_params)
    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food= Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = "Food successfully updated!"
      redirect_to foods_path
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "Food successfully destoryed!"
    redirect_to foods_path
  end

  private
  def food_params
    params.require(:food).permit(:name, :description, :image, :location, :price, :featured)
  end

end
