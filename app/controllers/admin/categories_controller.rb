class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash[:problem] = "Please submit a Category"
      redirect_to new_admin_category_path
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find_by(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(params[:id])
    @category.delete
    redirect_to admin_categories_path 
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
