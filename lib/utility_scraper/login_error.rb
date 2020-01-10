module UtilityScraper
  class LoginError < StandardError
    def initialize(msg = 'Error logging in, please check your credentials and try again')
      super
    end
  end
end
