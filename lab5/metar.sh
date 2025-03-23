#!/usr/bin/env bash
curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85" > aviation.json
jq '.[].receiptTime' aviation.json | head -n 6
avg=$(jq '[.[]|.temp] | map(select(. != null)) | add / length' aviation.json)
printf "\"Average Temperature: %.1f\"\n" "$avg"
nonCLR=$(jq '[.[]|.clouds[0].cover] | map(select(. != "CLR")) | length' aviation.json)
total=$(jq 'length' aviation.json)
if (( nonCLR > total / 2 )); then
  echo "\"Mostly Cloudy: true\""
else
  echo "\"Mostly Cloudy: false\""
fi



