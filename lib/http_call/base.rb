module HttpCall
  class Base
    attr_reader :uri, :body, :header

    def initialize(params)
      @uri     = format_url(params.fetch(:url))
      @body    = params.fetch(:body, nil)
      @header  = params.fetch(:header, {})
      @attempt = 3
    end

    protected

    attr_accessor :attempt

    def request
      response = yield
      raise response if !response.is_a?(Net::HTTPSuccess)
      response
    rescue
      @attempt -= 1
      return response if attempt == 0
      sleep(5)
      retry
    end

    private

    def format_url(url)
      URI(url)
    end
  end
end