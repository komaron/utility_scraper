module UtilityScraper
  class PrintReport
    attr_reader :details

    def initialize(options)
      @details = AccountDetails.new(options)
    end

    def perform
      puts report
    end

    private

    def report
      %(
        ----------------------------------------
            Dominion Power Account Summary
        ----------------------------------------
        Usage [kWh]:\t\t #{details.current_usage.green}
        Bill Amount:\t\t #{details.bill_amount.red}
        Service Start Day:\t #{details.service_start_date}
        Service End Day:\t #{details.service_end_date}
        Bill Due Date:\t\t #{details.bill_due_date.yellow}
      )
    end
  end
end
