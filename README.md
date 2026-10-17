# Nmap Mail Banner Scripts

Two custom Nmap Scripting Engine (NSE) scripts for retrieving and displaying greeting banners from IMAP and POP3 services.

## Overview

Nmap's built-in `banner.nse` provides general-purpose banner retrieval. This project explores protocol-specific scripts that present banner information with clearer headings and structured output.

## Scripts

### `imap-banner-check.nse`

- Targets port 143 or a service identified as IMAP.
- Attempts to connect to the service and retrieve its first response line.
- Displays the target host, port, service, and retrieved banner.
- Reports connection or banner-retrieval errors.

### `pop3-banner-check.nse`

- Targets port 110 or a service identified as POP3.
- Attempts to connect to the service and retrieve its first response line.
- Displays the target host, port, service, and retrieved banner.
- Reports connection or banner-retrieval errors.

Both scripts use Nmap's socket API and a five-second socket timeout.

## Requirements

- Nmap with Nmap Scripting Engine (NSE) support.
- An accessible IMAP or POP3 service for testing.
- Permission to scan the target system.

## Usage

Run the relevant command from the directory containing the scripts:

**IMAP**
```bash
sudo nmap -p143 --script ./imap-banner-check.nse localhost
```

**POP3**
```bash
sudo nmap -p110 --script ./pop3-banner-check.nse localhost
```

Replace `localhost` with an authorized test target when appropriate.

## Testing Environment

The scripts were tested in Ubuntu under Windows Subsystem for Linux (WSL), using a local Dovecot mail service listening on TCP ports 110 and 143.

The observed test results confirmed that each script retrieved the expected greeting from its corresponding service.

## Scope and Limitations

These scripts are focused demonstrations of protocol-specific banner retrieval. They are not complete replacements for all the functionality provided by Nmap's general-purpose `banner.nse`.

Use them only against systems you own or have permission to test.

## References

- [Nmap Scripting Engine documentation](https://nmap.org/book/nse.html)
- [Nmap banner script documentation](https://nmap.org/nsedoc/scripts/banner.html)
- [Official Nmap banner.nse source](https://github.com/nmap/nmap/blob/master/scripts/banner.nse)
