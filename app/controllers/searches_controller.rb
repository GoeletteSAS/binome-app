class SearchesController < ApplicationController


  def new

    # @experience = current_user.experiences.where(is_current: true)
    # if @experience
    #   return
    # else
    if params[:search][:is_offering] == "false"
      @search = Search.new(is_offering: false)
    else
      @search = Search.new(is_offering: true, line_of_work: current_user.current_experience.line_of_work, field: current_user.current_experience.field, address: current_user.current_experience.address, experience: current_user.current_experience, user: current_user)
    end

    @lines_of_work = Search::LINES_OF_WORK
    @departments = Search::DEPARTMENTS
    @fields = Search::FIELDS
    # end
  end

  def init
    @search = Search.new
  end

  def create


    @search = Search.new(search_params)
    @search.user = current_user

  # else
    if @search.save
      redirect_to dashboard_searches_path
    else
      render 'new', status: :unprocessable_entity
    end
  # end
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
