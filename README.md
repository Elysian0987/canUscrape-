# canUscrape

> An automated robots.txt auditor for Ethical Hackers, Penetration Testers, and Security Researchers.

**canUscrape** is a lightweight Ruby CLI tool designed to perform quick reconnaissance on web targets. It fetches and parses a site's robots.txt file to determine scraping permissions, identify hidden directories, and assist in ethical data gathering during security assessments.

---

## Cyber Security Perspective

In the realm of **OSINT (Open Source Intelligence)** and penetration testing, robots.txt is often a goldmine for security researchers. This file reveals:

### Hidden Attack Surfaces
Administrators often use "Disallow" rules to hide sensitive paths like:
- `/admin` - Administrative panels
- `/staging` - Unpatched development environments
- `/backup` - Database dumps or backup files
- `/config` - Configuration files
- `/.git` - Exposed version control repositories
- `/api/internal` - Internal API endpoints

**Security Impact**: These "hidden" paths are publicly disclosed and should be considered part of your attack surface during a pentest.

### Sitemap Intelligence
Discovering sitemaps enables:
- Complete directory enumeration
- Endpoint discovery for API testing
- Identification of forgotten or legacy pages
- Parameter discovery for injection testing

### Compliance During Red Team Operations
- Ensures automated tools respect site policies during authorized testing
- Prevents unnecessary IP bans that could compromise stealth operations
- Documents responsible reconnaissance practices for client reports

### Common Security Findings via robots.txt
```
Disallow: /admin/           → Potential unauthorized access
Disallow: /backup/          → Possible data exposure
Disallow: /private/         → Access control review needed
Disallow: /.env             → Environment variable leakage
Disallow: /api/v1/internal/ → Hidden API endpoints
```

---

## Features

- **Automated Recon**: Instantly checks the root directory for robots.txt
- **Targeted Auditing**: Check permissions for specific subdirectories or files
- **Sitemap Discovery**: Automatically flags sitemap URLs for further mapping
- **HTTP Status Handling**: Differentiates between missing files (404) and access denial (403)
- **Color-Coded Output**: Quick visual indicators for security assessments
- **Penetration Testing Ready**: Integrates into security workflows and reconnaissance phases

---

## Installation

Ensure you have Ruby installed (3.0+ recommended), then:

```bash
git clone https://github.com/your-username/canUscrape.git
cd canUscrape
bundle install
```

---

## Usage

### Basic Reconnaissance
Run the auditor against any domain:

```bash
ruby bin/can_u_scrape.rb https://example.com
```

### Targeted Path Analysis
Check specific endpoints during security assessments:

```bash
ruby bin/can_u_scrape.rb https://example.com /admin
```

### Penetration Testing Examples

```bash
# Recon against potential admin panel
ruby bin/can_u_scrape.rb https://target.com /admin

# Check for exposed API documentation
ruby bin/can_u_scrape.rb https://target.com /api/docs

# Test for backup directory disclosure
ruby bin/can_u_scrape.rb https://target.com /backup

# Check staging environment
ruby bin/can_u_scrape.rb https://target.com /staging

# Look for version control exposure
ruby bin/can_u_scrape.rb https://target.com /.git
```

---

## Example Output

```plaintext
[*] Auditing: https://example.com/robots.txt

[+] Status: 200 OK
[*] Analyzing robots.txt for wildcard User-agent (*)

[-] FORBIDDEN: Scraping '/admin' is restricted by robots.txt
[!] Security Note: This path may contain sensitive resources.

[i] Recon Intel: Sitemaps discovered! These are valuable for mapping the attack surface:
   → https://example.com/sitemap.xml
   → https://example.com/sitemap-pages.xml

[*] Disallowed Paths Found (Potential Recon Targets):
   • /admin/
   • /backup/
   • /private/
   • /config/
```

---

## Security Use Cases

### 1. **Penetration Testing Reconnaissance**
Use during the information gathering phase to discover:
- Forgotten admin panels
- Development/staging environments
- Backup directories
- Exposed configuration files

### 2. **Bug Bounty Hunting**
Quickly enumerate potential targets:
- Identify high-value endpoints
- Discover deprecated APIs
- Find forgotten subdomains via sitemaps

### 3. **Security Auditing**
- Verify that sensitive paths are properly protected (not just obscured)
- Identify security through obscurity practices
- Document publicly disclosed attack surface

### 4. **Red Team Operations**
- Passive reconnaissance without triggering alarms
- Identify initial access vectors
- Map target infrastructure stealthily

---

## Legal Disclaimer

**IMPORTANT**: This tool is for **educational and ethical purposes only**.

- [+] Only use on systems you own or have **explicit written permission** to test
- [+] Respecting robots.txt is a cornerstone of responsible web citizenship
- [+] Always comply with applicable laws and regulations (CFAA, GDPR, etc.)
- [-] Unauthorized access or testing is illegal and unethical

**For Security Professionals**: Always ensure proper scope documentation and authorization before using this tool in any assessment.

---

## Skills Demonstrated

This project showcases capabilities relevant to cybersecurity roles:

- **OSINT & Reconnaissance**: Passive information gathering techniques
- **Ruby Development**: Clean, maintainable code for security tooling
- **HTTP Protocol Understanding**: Status codes, headers, and web fundamentals
- **Security Automation**: Building tools to enhance penetration testing efficiency
- **Ethical Hacking Mindset**: Responsible disclosure and authorized testing practices
- **Parsing & Pattern Matching**: Analyzing semi-structured security data

---

## Contributing

Security researchers and developers are welcome to contribute:
- Additional robots.txt parsing features
- Integration with other OSINT tools
- Enhanced output formats (JSON, CSV for reporting)
- Crawl-delay analysis
- Multi-User-agent support

---

## Related Resources

- [OWASP Testing Guide - Information Gathering](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/)
- [robots.txt RFC 9309](https://www.rfc-editor.org/rfc/rfc9309.html)
- [Penetration Testing Execution Standard](http://www.pentest-standard.org/)

---

## Contact

For security inquiries or responsible disclosure: [your-email@example.com]

---

## License

MIT License - See LICENSE file for details.

---

*Built for the ethical hacking community*