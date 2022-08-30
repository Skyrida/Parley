class ArgumentsController < ApplicationController
  def index

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
