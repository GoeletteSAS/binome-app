class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.save
    redirect_to # à définir
  end
  
  def update
    @search = Search.find(params[:id])
    @search.update(search_params)
    redirect_to # à définir
  end

  def destroy
    @search.find(params[:id])
    @search.destroy
    # path à définir
    redirect_to somewhere_path, status: :see_other
  end

  private

  def search_params
    params.require(:search).permit(:user_id, :experience_id, :line_of_work, :field, :address, :is_offering)
  end

end
