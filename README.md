# Utilities Scraper
Using your login credentials to a utility company's website this scraper will extract data from their website and display it to you via the command line.

## Dependencies
- Mechanize
- Nokogiri
- Colorize

## Basic Usage
```bash
$ bundle exec bin/retrieve_latest_bill [username] [password]
```
Example:
```bash
$ bundle exec ruby bin/retrieve_latest_bill testuser password1
```

Expected Output (example)
```
 ----------------------------------------
      Dominion Power Account Summary
  ----------------------------------------
  Usage [kWh]:             1023
  Bill Amount:             $120.34
  Service Start Day:       4/21/2020
  Service End Day:         5/23/2020
  Bill Due Date:           June 20, 2020
  ```

## Testing
```bash
$ bundle exec rspec
```

## Supported Utility Companies
- Dominion Energy
