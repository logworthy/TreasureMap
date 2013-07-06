#! /bin/sh

# download raw polling place and vote data from AEC

# polling place gis data
wget http://results.aec.gov.au/15508/Website/Downloads/GeneralPollingPlacesDownload-15508.csv

# polling place voting data
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-NSW.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-QLD.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-VIC.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-ACT.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-TAS.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-SA.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-WA.zip
wget http://results.aec.gov.au/15508/Website/External/SenateStateFirstPrefsByPollingPlaceDownload-15508-NT.zip
