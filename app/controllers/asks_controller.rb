
class AsksController < ApplicationController
  def index
    @asks = Ask.all
    @answer = params[:answer]
  end

  def new
    @ask = Ask.new
  end
  def show
    @ask = Ask.find(params[:id])
  end

  def create
    api_key = Rails.application.credentials.chatgpt_api_key

    response = HTTParty.post("https://api.openai.com/v1/chat/completions", {
      headers: {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{api_key}"
      },
      body: {
        model: 'gpt-3.5-turbo',
        # prompt: params[:title],
        messages: [{ role: 'user', content: params[:title] }],
        max_tokens: 100,
        n: 1,
        stop: "\n"
      }.to_json
    })

    @answer = response.parsed_response['choices'][0]["message"]["content"]

    logger.info "this is the answer"
    logger.info @answer
    redirect_to root_path(answer: @answer)

  end

  private
  def ask_params
    params.require(:ask).permit(:title)
  end

end