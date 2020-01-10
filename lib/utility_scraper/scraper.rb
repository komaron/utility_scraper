module UtilityScraper
  class Scraper
    attr_accessor :account_details
    attr_reader :username, :password

    UTILITY_SITE = 'https://mydom.dominionenergy.com/'.freeze
    STATEMENTS_PATH = '/Usage/ViewPastUsage?statementType=4'.freeze

    def initialize(options)
      @username = options[:username]
      @password = options[:password]
      @page = nil
      @account_details = {}
    end

    def perform
      login
      raise LoginError unless successful_login?
      retrieve_bill_data

      account_details
    end

    def login
      @page = agent.get(UTILITY_SITE)

      @page.form.field_with(name: 'USER').value = username
      @page.form.field_with(name: 'PASSWORD').value = password
      @page.form.submit
    end

    def successful_login?
      # Refreshing the home page
      @page = agent.get(UTILITY_SITE)
      @page.links.map(&:to_s).include?('Sign Out')
    end

    def retrieve_bill_data
      account_details[:bill_due_date] = @page.css('.bodyTextGreen').first.text.strip
      account_details[:bill_amount] = @page.css('.bodyTextGreen').last.text.strip

      # Navigate to the logged in users statements page
      @page = agent.get(STATEMENTS_PATH)

      account_details[:current_usage] = @page.css('#paymentsTable tr:nth-child(2) td:nth-child(5)').text.strip
      account_details[:service_start_date] = @page.css('#paymentsTable tr:nth-child(3) td:nth-child(1)').text.strip
      account_details[:service_end_date] = @page.css('#paymentsTable tr:nth-child(2) td:nth-child(1)').text.strip
    end

    def agent
      @agent ||= Mechanize.new
    end
  end
end
