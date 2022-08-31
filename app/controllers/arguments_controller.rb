class ArgumentsController < ApplicationController
  def index
    @debate = Debate.find(params[:debate_id])
    @arguments = @debate.arguments
  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def argument_params
    params.require(:argument).permit(:content, :perspective_pro)
  end
end
