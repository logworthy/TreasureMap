drop table polling_places;

create table polling_places (
	State text,
	DivisionID numeric,
	DivisionNm text,
	PollingPlaceID numeric,
	PollingPlaceTypeID numeric,
	PollingPlaceNm text,
	PremisesNm text,
	PremisesAddress1 text,
	PremisesAddress2 text,
	PremisesAddress3 text,
	PremisesSuburb text,
	PremisesStateAb text,
	PremisesPostCode numeric,
	Latitude text,
	Longitude text
);

copy polling_places (
	State,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceTypeID,
	PollingPlaceNm,
	PremisesNm,
	PremisesAddress1,
	PremisesAddress2,
	PremisesAddress3,
	PremisesSuburb,
	PremisesStateAb,
	PremisesPostCode,
	Latitude,
	Longitude
) from '/home/ubuntu/TreasureMap/PollingPlaces.csv'
with delimiter as ','
	csv header;

drop table senate_votes;
create table senate_votes (
	StateAb text,
	DivisionID numeric,
	DivisionNm text,
	PollingPlaceID numeric,
	PollingPlaceNm text,
	Ticket text,
	CandidateID numeric,
	BallotPosition numeric,
	CandidateDetails text,
	PartyNm text,
	OrdinaryVotes numeric
);

copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/ACTVotes.csv'
with delimiter as ','
	csv header;

copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/QLDVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/VICVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/NSWVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/TASVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/SAVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/WAVotes.csv'
with delimiter as ','
	csv header;
copy senate_votes (
	StateAb,
	DivisionID,
	DivisionNm,
	PollingPlaceID,
	PollingPlaceNm,
	Ticket,
	CandidateID,
	BallotPosition,
	CandidateDetails,
	PartyNm,
	OrdinaryVotes
) from '/home/ubuntu/TreasureMap/NTVotes.csv'
with delimiter as ','
	csv header;
select AddGeometryColumn ('public', 'polling_places', 'geom', 4326, 'POINT', 2);
update public.polling_places set geom=ST_GeometryFromText('POINT(' || longitude || ' ' || latitude || ')',4326);

create table tmp_pp_distance as 
select a.pollingplaceid, min(ST_Distance(a.geom, b.geom)) as nearest_pp
from
	public.polling_places a,
	public.polling_places b 
	where a.pollingplaceid <> b.pollingplaceid
group by a.pollingplaceid;
