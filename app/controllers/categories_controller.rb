class CategoriesController < ApplicationController
  #before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.valid?
        @category.save
        flash[:notice] = "Created Successfully."
        redirect_to home_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id]) 
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Updated Successfully."
      redirect_to home_path
    else
      flash[:notice] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Deleted."
    redirect_to home_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
