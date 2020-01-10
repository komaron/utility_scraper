module UtilityScraper
  class Worker
    attr_reader :options

    def initialize(username, password)
      @options = {
        username: username,
        password: password
      }
    end

    def perform
      details = Scraper.new(options).perform
      PrintReport.new(details).perform
    end
  end
end
