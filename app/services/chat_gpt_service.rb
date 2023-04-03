class ChatGPTService
  # attr_reader :api_url, :options, :model, :message

  # message: string to generate a response for
  # model: model to use for the response
  def initialize(message, model = 'gpt-3.5-turbo')
    api_key = Rails.application.credentials.chatgpt_api_key
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/engine/davinci-codex/completions'
    @model = model
    @message = message
  end

  def call
    body = {
      model: model,
      messages: [{ role: 'user', content: message }]
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 10)
    # raise response['error']['message'] unless response.code == 200

    response['choices'][0]['message']['content']
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end