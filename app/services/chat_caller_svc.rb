class ChatCallerSvc
  # attr_reader :api_url, :options, :model, :message --> do I need this?

  def initialize(message, model = 'gpt-3.5-turbo')
    @command = "respond with a made up inspirational sentiment that relates to the following message: \"#{message}\""
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
      temperature: 0.1,
      n: 1,
      stop: "\n"
    }
    response = HTTParty.post(@api_url, body: body.to_json, headers: @options[:headers])

    response.parsed_response['choices'][0]['message']['content']
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end