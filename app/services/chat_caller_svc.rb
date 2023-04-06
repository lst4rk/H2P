class ChatCallerSvc
  # attr_reader :api_url, :options, :model, :message --> do I need this?

  def initialize(message, model = 'gpt-3.5-turbo')
    @command = "respond with a inspirational quotation in response to the following sentiment: \"#{message}\""
    api_key = Rails.application.credentials.chatgpt_api_key

    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = "https://api.openai.com/v1/chat/completions"
    @model = model
    @message = message
  end

  def call
    body = {
      model: @model,
      messages: [{ role: 'user', content: @command }],
      max_tokens: 500,
      n: 1,
      stop: "\n"
    }
    response = HTTParty.post(@api_url, body: body.to_json, headers: @options[:headers])
    # raise response['error']['message'] unless response.code == 200

    response.parsed_response['choices'][0]['message']['content']
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end