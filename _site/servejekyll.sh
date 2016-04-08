 #!/bin/bash

cd ~/MQ-FOAR705.github.io
bundle exec jekyll serve &
cd ~
./ngrok http 4000
pkill ruby-mri
