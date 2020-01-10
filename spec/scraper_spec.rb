#!/usr/bin/ruby

load 'lib/utility_scraper.rb'

describe UtilityScraper::Scraper do
  before(:all) do
    @options = {
      username: 'test_user',
      password: 'test_pass'
    }
  end

  describe '#perform' do
    context 'failed attempt of logging ing and extracting details' do
      it {
        expect { UtilityScraper::Scraper.new(@options).perform }
          .to raise_error(UtilityScraper::LoginError)
      }
    end
  end
end
