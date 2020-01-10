module UtilityScraper
  class LoginError < StandardError
    def initialize(msg = 'Error Loging please check your credentials and try again')
      super
    end
  end
end
