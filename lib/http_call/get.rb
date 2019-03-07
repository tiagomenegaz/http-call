module HttpCall
  class Get < Base
    def call
      request { HTTParty.get(url) }
    end
  end
end