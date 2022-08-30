class DebatesController < ApplicationController
  def index

  end

  def show

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
