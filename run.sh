#!/bin/sh
while true
do
  git clone https://github.com/DouglasSherk/gaia.git
  (cd gaia;
   git checkout gaiadocco;
   git fetch origin;
   git reset --hard origin/gaiadocco)

  cat gaia/shared/style/*.css > styles.css

  styledocco -o dialer-docs --include styles.css gaia/shared/style/dialer/
  sed -i 's/..\/gaia\/shared\///g' dialer-docs/*

  scp -r dialer-docs people.mozilla.org:~/public_html/
  scp -r gaia/shared/style people.mozilla.org:~/public_html/dialer-docs/
  ssh people.mozilla.org chmod 755 ~/public_html/dialer-docs
  sleep 10
done
