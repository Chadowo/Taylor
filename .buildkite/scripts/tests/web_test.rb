#!/usr/bin/env ruby

require 'webrick'
require 'selenium-webdriver'
require 'webdrivers/chromedriver'

root = File.expand_path '.'
server = WEBrick::HTTPServer.new :Port => 3001, :DocumentRoot => root

server_thread = Thread.start { server.start }

options = Selenium::WebDriver::Chrome::Options.new(args: ['no-sandbox', 'disable-dev-shm-usage'])
driver = Selenium::WebDriver.for(:chrome, capabilities: [options])
driver.manage.window.resize_to(1280, 800)

puts driver.logs.available_types

driver.get('http://localhost:3001')

start_time = Time.now
loop do
  sleep 0.1
  browser_logs = driver.logs.get :browser

  browser_logs.each { |log|
    exit 1 if log.message.include?("program exited (with status: 1)")
  }

  taylor_logs = driver.find_element(:css, '#logs').text


  taylor_logs.each_line { |log|
    puts log.chomp
    if log.include?("EXIT CODE:")
      _, code = log.split("EXIT CODE: ")
      exit code.to_i
    end
  }

  # Give the tests 1 minute to run (which should be ample)
  exit 1 if Time.now - start_time > 60
end
