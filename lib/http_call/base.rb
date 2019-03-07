module HttpCall
  class Base
    attr_reader :url, :body, :header

    def initialize(params)
      @url     = params.fetch(:url)
      @body    = params.fetch(:body, nil)
      @header  = params.fetch(:header, {})
      @attempt = 3
    end

    protected

    attr_accessor :attempt

    def request
      response = yield
      raise response.body if !response.success?
      response
    rescue
      @attempt -= 1
      return response if attempt == 0
      sleep(5)
      retry
    end
  end
end