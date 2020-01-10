#!/usr/bin/ruby

load 'lib/utility_scraper.rb'

describe UtilityScraper::PrintReport do
  before(:all) do
    @options = {
      bill_amount: '$86.40',
      bill_due_date: 'January 20, 2020',
      current_usage: '641',
      service_start_date: '11/21/2019',
      service_end_date:  '12/23/2019'
    }
  end

  describe '#perform' do
    context 'outputs the contexts of a file' do
        @results = %(
        ----------------------------------------
            Dominion Power Account Summary
        ----------------------------------------
        Usage [kWh]:             641
        Bill Amount:             $86.40
        Service Start Day:       11/21/2019
        Service End Day:         12/23/2019
        Bill Due Date:           January 20, 2020
      )
      it {
        expect(UtilityScraper::PrintReport.new(@options).perform)
          .to eql(@results)
      }
    end
  end
end
