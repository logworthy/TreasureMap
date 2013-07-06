#! /bin/sh

# unzip polling place voting data
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-ACT.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-NSW.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-NT.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-QLD.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-SA.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-TAS.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-VIC.zip
unzip SenateStateFirstPrefsByPollingPlaceDownload-15508-WA.zip

# remove the extra header lines
tail -n +2 GeneralPollingPlacesDownload-15508.csv > PollingPlaces.csv

tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-ACT.csv > ACTVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-NSW.csv > NSWVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-QLD.csv > QLDVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-VIC.csv > VICVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-TAS.csv > TASVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-SA.csv > SAVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-WA.csv > WAVotes.csv
tail -n +2 SenateStateFirstPrefsByPollingPlaceDownload-15508-NT.csv > NTVotes.csv

# create database
sudo -u postgres psql -d TreasureMap -f polling_places.sql 
