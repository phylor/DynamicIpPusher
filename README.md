# How to build your own dynamic IP solution

You would like to host a service with an internet connection having a dynamic IP assignment.

**Note:** You need a root server with a fixed IP address for this recipe to work. Furthermore, this is a straightforward and bruteforce approach.

## What you need

- Computer running `cron` in the network having the dynamic IP assignment
- Computer running `ruby` in an external network having a fixed IP

## Solution Overview

Components:

- Ruby script running an HTTP server to post and get an IP address from
- Cron script posting the dynamic IP address to the HTTP server (at specific time intervals)

### Setup HTTP server
1. Clone this repository
2. `bundle install`
3. Setup Apache or any other ruby web server to run the rack application contained in it
4. Add a subdomain or any other way to access the ruby application

### Setup Cron script
1. Copy the following code in a shell script called `update_dynamic_ip.sh`

	#!/bin/sh
	
	curl -X PUT dynamicippusher.example.com/ipaddress

2. Add a new line in `crontab -e`:

	*/5 *    *   *   *   /path/to/update_dynamic_ip.sh

