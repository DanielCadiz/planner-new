class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.valid?
        @category.save
        flash[:notice] = "Created Successfully."
        redirect_to home_path
    else
      render :new
    end
  end

  def show
    @category = current_user.categories.find(params[:id]) 
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Updated Successfully."
      redirect_to home_path
    else
      flash[:notice] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    flash[:notice] = "Deleted."
    redirect_to home_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
