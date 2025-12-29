require 'httparty'
require 'colorize'
require 'uri'

class CanUScrape
  def initialize(url)
    @base_url = URI.parse(url).select(:scheme, :host).join("://")
    @robots_url = "#{@base_url}/robots.txt"
    @user_agent = "*" # Defaulting to all bots
  end

  def audit(target_path = "/")
    puts "[*] Auditing: #{@robots_url}".bold.blue
    
    response = HTTParty.get(@robots_url, headers: { "User-Agent" => "canUscrape-audit-bot" })

    case response.code
    when 404
      puts "[+] No robots.txt found. (Standard rule: Everything is allowed)".green
    when 200
      check_rules(response.body, target_path)
    else
      puts "[!] Warning: Received HTTP #{response.code}. Site might be blocking auditors.".yellow
    end
  end

  private

  def check_rules(content, path)
    # Simple logic: If 'Disallow: /path' exists under User-agent: *
    if content.include?("Disallow: #{path}") || content.include?("Disallow: /")
      puts "[-] FORBIDDEN: Scraping '#{path}' is restricted by robots.txt".red
    else
      puts "[+] PERMITTED: No explicit disallow rule found for '#{path}'".green
    end

    # Bonus Recon for Security
    if content.include?("Sitemap:")
      puts "[i] Recon: Sitemaps discovered! These are great for mapping the attack surface.".magenta
    end
  end
end

# Usage: ruby bin/can_u_scrape.rb https://example.com /secret-admin
target = ARGV[0] || "https://google.com"
path = ARGV[1] || "/"
CanUScrape.new(target).audit(path)
