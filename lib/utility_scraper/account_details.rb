module UtilityScraper
  class AccountDetails
    attr_reader :bill_amount, :bill_due_date, :current_usage, :service_start_date, :service_end_date

    def initialize(options)
      @bill_amount = options[:bill_amount]
      @bill_due_date = options[:bill_due_date]
      @current_usage = options[:current_usage]
      @service_start_date = options[:service_start_date]
      @service_end_date = options[:service_end_date]
    end
  end
end
