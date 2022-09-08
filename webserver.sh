#!/bin/bash

# while true ; do  echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l -p 8080  ; done

ruby -rwebrick -e's=WEBrick::HTTPServer.new(:Port => 8080, :DocumentRoot => Dir.pwd).start'
