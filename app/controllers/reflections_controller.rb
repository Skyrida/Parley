class ReflectionsController < ApplicationController
  def show

  end

  def new

  end

  def create

  end

  private

  def reflections_params
    params.require(:reflection).permit(:debate_chat_score, :conclusion)
  end
end
