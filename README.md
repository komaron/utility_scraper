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

## Testing
```bash
$ bundle exec rspec
```

## Supported Utility Companies
- Dominion Energy
