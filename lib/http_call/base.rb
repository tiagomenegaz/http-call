module HttpCall
  class Base
    attr_reader :url, :body, :header

    def initialize(params)
      @url     = params.fetch(:url)
      @body    = params.fetch(:body, nil)
      @header  = params.fetch(:header, {})
      @attempt = 3
    end

    def call; end

    private

    attr_reader :attempt

    def request
      response = yield
      raise 'Error' if res.is_a?(Net::HTTPSuccess)
      response
    rescue
      retry_request
    end

    def retry_request
      attempt -= 1
      return response if attempt == 0
      sleep(5)
    end
  end
end