class ArgumentsController < ApplicationController
  def index
    @debate = Debate.find(params[:debate_id])
    @arguments = @debate.arguments
  end

  def new
    @debate =  Debate.find(params[:debate_id])
    @argument = Argument.new
  end

  def create
    @argument = Argument.new(argument_params)
    @argument.user = current_user
    @argument.debate = Debate.find(params[:debate_id])

    if params[:commit] == 'Pro'
      @argument.perspective_pro = true
    elsif params[:commit] == 'Con'
      @argument.perspective_pro = false
    end

    if @argument.save
      redirect_to debate_path(@argument.debate_id)
    else
      redirect_to new_debate_argument_path
    end
  end

  def destroy

  end

  private

  def argument_params
    params.require(:argument).permit(:content, :perspective_pro)
  end
end
