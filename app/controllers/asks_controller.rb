
class AsksController < ApplicationController
  def index
    @asks = Ask.all.order('created_at DESC')
    render json: @asks
    # @answer = params[:answer]
  end

  def new
    @ask = Ask.new
  end
  def show
    @ask = Ask.find(params[:id])
  end

  def create
    @answer = ChatCallerSvc.call(params[:title])
    @ask = Ask.new(title: ask_params[:title], body: "\"#{@answer}")

    render json: @ask
    # if @ask.save
    #   redirect_to root_path(answer: @ask.body)
    # else
    #   render :new, status: :unprocessable_entity
    # end

  end

  def destroy
    @ask = Ask.find(params[:id])
    @ask.destroy
    head :no_content, status: ok
    # redirect_to root_path, status: :see_other
  end

  private
    def ask_params
      params.require(:ask).permit(:title)
    end

end