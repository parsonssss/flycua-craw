#!/bin/bash

today_filename=$(date +'%Y-%m-%d.yaml')
yes_filename=$(date -d '-1day' +'%Y-%m-%d.yaml')
diff  $today_filename $yes_filename|sed -n '5,$p'  > price.diff
