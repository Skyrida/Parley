class DebatesController < ApplicationController
  def index
    if params[:title]
      @debates = Debate.where(title: params[:title])
    elsif params[:query]
      @debates = Debate.search_by_title(params[:query])
    else
      @debates = Debate.all
    end
  end


  def show
    @debate = Debate.find(params[:id])
    @arguments = @debate.arguments

    if params[:category] == "pro"
      @arguments = @debate.arguments.where(perspective_pro: true)
    elsif params[:category] == "con"
      @arguments = @debate.arguments.where(perspective_pro: false)
    end
  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def debate_params
    params.require(:debate).permit(:title, :image)
  end
end
