# CanUScrape

> A professional Ruby tool for auditing website robots.txt files and determining legal scraping permissions.

## Features

- Validates scraping permissions for specific paths
- Parses robots.txt rules for User-agent: *
- Discovers sitemaps for reconnaissance purposes
- Color-coded terminal output for clarity
- Comprehensive HTTP status code handling

## Installation

1. Make sure you have Ruby installed (3.0 or higher recommended)

2. Install dependencies:
```bash
bundle install
```

## Usage

Basic usage:
```bash
ruby bin/can_u_scrape.rb https://example.com
```

Check a specific path:
```bash
ruby bin/can_u_scrape.rb https://example.com /api
```

### Examples

```bash
# Check Google's robots.txt
ruby bin/can_u_scrape.rb https://google.com

# Check Wikipedia's API endpoint
ruby bin/can_u_scrape.rb https://en.wikipedia.org /w/api.php

# Check if you can scrape a specific admin path
ruby bin/can_u_scrape.rb https://example.com /admin

# Check API endpoint
ruby bin/can_u_scrape.rb https://example.com /api/v1
```

## How It Works

1. Takes a target URL and optional path
2. Fetches the `robots.txt` file from the domain
3. Analyzes the rules for the wildcard User-agent (`*`)
4. Reports whether scraping is permitted or forbidden
5. Discovers any sitemaps listed in robots.txt

## Output

- **Green**: Scraping is permitted
- **Red**: Scraping is forbidden by robots.txt
- **Yellow**: Warning (unusual HTTP response)
- **Magenta**: Additional information (sitemaps found)

## Legal Notice

This tool helps you check robots.txt compliance. Always respect:
- robots.txt directives
- Terms of Service
- Rate limiting
- Copyright laws
- Data protection regulations

Use this tool responsibly and ethically.

## License

MIT