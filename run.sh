#!/bin/bash
sudo docker run -it --rm -v $(pwd)/volume:/opt/app/volume metasploit:latest msfconsole