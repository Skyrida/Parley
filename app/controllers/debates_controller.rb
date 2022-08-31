class DebatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show

  end

  def new
    @debate = Debate.new
  end

  def create
    @debate = Debate.new(debate_params)
    @debate.save
    redirect_to debate_path(@debate)
  end

  def destroy

  end

  private

  def debate_params
    params.require(:debate).permit(:title, :image)
  end
end
