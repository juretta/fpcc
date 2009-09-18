#!/usr/bin/env ruby

require 'rubygems'
require 'stomp'
require 'json'
require 'readline'

module Stomp
  class Connection
    def _transmit(s, command, headers = {}, body = '')
      @transmit_semaphore.synchronize do
        unless headers['suppress_content_length']
          headers['content-length'] = "#{body.length}"
        else
          headers.delete 'suppress_content_length'
        end
        s.puts command
        headers.each {|k,v| s.puts "#{k}:#{v}" }
        s.puts "content-type: text/plain; charset=UTF-8"
        s.puts
        s.write body
        s.write "\0"
      end
    end
  end
end

args = ['system', 'qdajsqenqlwjkqnqk234234b2kl', 'localhost', 61613, true]
conn = Stomp::Connection.open *args 

loop do
  line = Readline::readline('> ')
  Readline::HISTORY.push(line)
  break if line =~ /quit/i
  begin
    if line.strip.length > 0
      conn.send '/topic/systemMessagesTopic', line, 'suppress_content_length' => true, 'type' => 'javax.jms.TextMessage'#, 'transformation' => 'jms-map-json' #"type" => "TextMessage", 'activemq.dispatchAsync' => true#, :persistent => 'true'
    end
  rescue => e
    puts "Lost connection. Reconnection... Please send your message again!"
    conn = Stomp::Connection.open(args)
  end
end

conn.disconnect