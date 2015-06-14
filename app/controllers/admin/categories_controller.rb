class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admin_categories_path
    else
      flash.now[:errors] = category.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash.notice = "#{category.title} was destroyed!!"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
