module HttpCall
  class Get < Base
    def call
      request { Net::HTTP.get_response(uri) }
    end
  end
end