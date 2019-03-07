module HttpCall
  class Post < Base
    def call
      request { HTTParty.post(url, body: body, headers: header) }
    end
  end
end