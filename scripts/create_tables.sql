/*taken from NENA-sta-006.1.1-2020_ng9-1-.pdf*/ 

create schema if not exists ng911; 

/* create the centerline dataset */ 

create table ng911.centerlines as ( 
	id serial primary key, 
	geom geometry (polylines, 4326),
	discrpagid varchar(75) NOT NULL, 
	dateupdate timestamp, 
	effective timestamp, 
	expire timestamp, 
	rcl_nguid varchar(254) NOT NULL, 
	adnumpre_l varchar(15), 
	adnumpre_r cvarhar(15), 
	fromaddr_l integer NOT NULL,
	toaddr_l integer NOT NULL, 
	fromaddr_r integer NOT NULL, 
	toaddr_r integer NOT NULL, 
	parity_l varchar(1) NOT NULL, 
	parity_r varchar(1) NOT NULL, 
	st_premod varchar(15), 
	st_predir varchar(15),
	st_pretyp varchar(50),
	st_presep varchar(20),
	st_name varchar(60) NOT NULL, 
	st_postyp varchar(50), 
	st_posdir varchar(9), 
	st_posmod varchar(25), 
	lst_predir varchar(2), 
	lst_name varchar(75), 
	lst_type varchar(4), 
	lst_posdir varchar(2), 
	esn_l varchar(5), 
	esn_r varchar(5), 
	msagcomm_l varchar(30), 
	msagcomm_r varchar(30), 
	country_l varchar(2) NOT NULL, 
	country_r varchar(2) NOT NULL, 
	state_l varchar(2) NOT NULL, 
	state_r varchar(2) NOT NULL, 
	county_l varchar(40) NOT NULL, 
	county_r varchar(40) NOT NULL, 
	addcode_l varchar(6), 
	addcode_r varchar(6), 
	incmuni_l varchar(100) NOT NULL, 
	incmuni_r varchar(100) NOT NULL, 
	uninccom_l varchar(100), 
	uninccom_r varchar(100), 
	nbrhdcom_l varchar(100), 
	nbrhdcom_r varchar(100), 
	postcode_l varchar(7), 
	postcode_r varchar(7), 
	postcomm_l varchar(40), 
	postcomm_r varchar(40), 
	roadclass varchar(15), 
	oneway varchar(2), 
        speedlimit varchar(3), 
	valid_l varchar(1), 
	valid_r varchar(1), 
); 

comment on table ng911.centerlines is 'Road centerlines represent the estimated centerline of a real world roadway. GIS road
centerline arc-node topology is associated with attribute data containing information on
street names, address ranges, jurisdictional boundaries, and other attributes';
comment on column ng911.centerlines.id is  'Primary Key'; 
comment on column ng911.centerlines.discrpagid in s 'Discrepancy Agency ID'; 
comment on column ng911.centerlines.dateupdate in s 'Date Updated';
comment on column ng911.centerlines.effective in s 'Effective Date';
comment on column ng911.centerlines.expire in s 'Exiration Date ';
comment on column ng911.centerlines.rcl_nguid in s 'Road Centerline NENA Globally Unique';
comment on column ng911.centerlines.adnumpre_l in s 'Left Address Number Prefix';
comment on column ng911.centerlines.adnumpre_r in s 'Right Address Number PRefix';
comment on column ng911.centerlines.fromaddr_l in s 'Left FROM Address';
comment on column ng911.centerlines.toaddr_l in s 'Left TO Address';
comment on column ng911.centerlines.fromaddr_r in s 'Right FROM Address';
comment on column ng911.centerlines.toaddr_r in s 'Right TO Address';
comment on column ng911.centerlines.parity_l in s 'Parity Left';
comment on column ng911.centerlines.parity_r in s 'Parity Right';
comment on column ng911.centerlines.st_premod in s 'Street Name Pre Modifier';
comment on column ng911.centerlines.st_predir in s 'Street Name Pre Directional';
comment on column ng911.centerlines.st_pretyp in s 'Street Name Pre Type';
comment on column ng911.centerlines.st_presep in s 'Street Name Pre Type Separator';
comment on column ng911.centerlines.st_name in s 'Street Name';
comment on column ng911.centerlines.st_postyp in s 'Street Name Post Type';
comment on column ng911.centerlines.st_posdir in s 'Street Name Post Directional';
comment on column ng911.centerlines.st_posmod in s 'Street Name Post Modifier';
comment on column ng911.centerlines.lst_predir in s 'Legacy Street Name Pre Directional'; 
comment on column ng911.centerlines.lst_name in s 'Legacy Street Name';
comment on column ng911.centerlines.lst_type in s 'Legacy Street Name Type';
comment on column ng911.centerlines.lst_posdir in s 'Legacy Street Name Post Directional';
comment on column ng911.centerlines.esn_l in s 'ESN Left';
comment on column ng911.centerlines.esn_r in s 'ESN Right';
comment on column ng911.centerlines.msagcomm_l in s 'MSAG Community Name Left';
comment on column ng911.centerlines.msagcomm_r in s 'MSAG Community Name Right';
comment on column ng911.centerlines.country_l in s 'Country Left';
comment on column ng911.centerlines.country_r in s 'Country Right';
comment on column ng911.centerlines.state_l in s 'State Left';
comment on column ng911.centerlines.state_r in s 'State Right';
comment on column ng911.centerlines.county_l in s 'County Left';
comment on column ng911.centerlines.county_r in s 'County Right';
comment on column ng911.centerlines.addcode_l in s 'Additional Code Left';
comment on column ng911.centerlines.addcode_r in s 'Additional Code Right';
comment on column ng911.centerlines.incmuni_l in s 'Incorporated Municipality Left';
comment on column ng911.centerlines.incmuni_r in s 'Incorporated Municipality Right';
comment on column ng911.centerlines.uninccom_lin s 'Unincorporated Community Left';
comment on column ng911.centerlines.uninccom_r in s 'Unincorporated Community Right';
comment on column ng911.centerlines.nbrhdcom_l in s 'Neighborhood Community Left';
comment on column ng911.centerlines.nbrhdcom_r in s 'Neighborhood Community Right';
comment on column ng911.centerlines.postcode_l in s 'Postal Code Left';
comment on column ng911.centerlines.postcode_r in s 'Postal Code Right';
comment on column ng911.centerlines.postcomm_l in s 'Postal Community Name Left';
comment on column ng911.centerlines.postcomm_r in s 'Postal Community Name Right';
comment on column ng911.centerlines.roadclass in s 'Road Class';
comment on column ng911.centerlines.oneway in s 'One-Way';
comment on column ng911.centerlines.speedlimit in s 'Speed Limit';
comment on column ng911.centerlines.valid_l in s 'Validation Left';
comment on column ng911.centerlines.valid_r in s 'Validation Right';

/* Create Address Table */ 

create table ng911.addresspoints (
        id serial primary key,
        geom geometry (polylines, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        site_nguid char(254),
        country varchar(2),
        state varchar(2),
        county varchar(40),
        addcode varchar(6),
        adddatauri varchar(254),
        inc_muni varchar(100),
        uninc_comm varchar(100),
        nbrhd_comm varchar(100),
        addnum_pre varchar(15),
        add_number integer,
        addnum_suf varchar(15),
        st_premod varchar(15),
        st_predir varchar(9),
        st_pretyp varchar(50),
        st_presep varchar(20),
        st_name varchar(60),
        st_postyp varchar(50),
        st_posdir varchar(9),
        st_posmod varchar(25),
        lst_predir varchar(2),
        lst_name varchar(75),
        lst_type varchar(4),
        lst_posdir varchar(2),
        esn varchar(5),
        msagcomm varchar(30),
        post_comm varchar(40),
        post_code varchar(7),
        post_code4 varchar(4),
        building varchar(75),
        floor varchar(75),
        unit varchar(75),
        room varchar(75),
        seat varchar(75),
        addtl_loc varchar(225),
        landmkname varchar(150),
        mile_post varchar(150),
        place_type varchar(50),
        placement varchar(25),
        long double,
        lat double,
        elev integer
);

comment on table ng911.addresspoints is 'Site/Structure Address Points ideally represent the location of a site or structure or the location of access to a site or structure. Site/Structure Address Points can also represent landmarks.'; 
comment on column ng911.addresspoints.id is 'Primary Key'; 
comment on column ng911.addresspoints.discrpagid is 'Discrepancy Agency ID'; 
comment on column ng911.addresspoints.dateupdate is 'Date Updated'; 
comment on column ng911.addresspoints.effective is 'Effective Date'; 
comment on column ng911.addresspoints.expire is 'Expiration Date';  
comment on column ng911.addresspoints.site_nguid is 'Site NENA Globally Unique ID';
comment on column ng911.addresspoints.country is 'Country';
comment on column ng911.addresspoints.state is 'State';
comment on column ng911.addresspoints.county is 'County';
comment on column ng911.addresspoints.addcode is 'Additional Code';
comment on column ng911.addresspoints.adddatauri is 'Additional Data URI';
comment on column ng911.addresspoints.inc_muni is 'Incorporated Municipality';
comment on column ng911.addresspoints.uninc_comm is 'Unincorporated Community';
comment on column ng911.addresspoints.nbrhd_comm is 'Neighborhood Community';
comment on column ng911.addresspoints.addnum_pre is 'Address Number Prefix';
comment on column ng911.addresspoints.add_number is 'Address Number';
comment on column ng911.addresspoints.addnum_suf is 'Address Number Suffix';
comment on column ng911.addresspoints.st_premod is 'Street Name Pre Modifier';
comment on column ng911.addresspoints.st_predir is 'Street Name Pre Directional';
comment on column ng911.addresspoints.st_pretyp is 'Street Name Pre Type';
comment on column ng911.addresspoints.st_presep is 'Street Name Pre Type Separator';
comment on column ng911.addresspoints.st_name is 'Street Name';
comment on column ng911.addresspoints.st_postyp is 'Street Name Post Type';
comment on column ng911.addresspoints.st_posdir is 'Street Name Post Directional';
comment on column ng911.addresspoints.st_posmod is 'Street Name Post Modifier';
comment on column ng911.addresspoints.lst_predir is 'Legacy Street Name Pre Directional';
comment on column ng911.addresspoints.lst_name is 'Legacy Street Name';
comment on column ng911.addresspoints.lst_type is 'Legacy Street Name Type';
comment on column ng911.addresspoints.lst_posdir is 'Legacy Street Name Post Directional';
comment on column ng911.addresspoints.esn is 'ESN';
comment on column ng911.addresspoints.msagcomm is 'MSAG Community Name';
comment on column ng911.addresspoints.post_comm is 'Postal Community Name';
comment on column ng911.addresspoints.post_code is 'Postal Code';
comment on column ng911.addresspoints.post_code4 is 'ZIP Plus 4';
comment on column ng911.addresspoints.building is 'Building';
comment on column ng911.addresspoints.floor is 'Floor';
comment on column ng911.addresspoints.unit is 'Unit';
comment on column ng911.addresspoints.room is 'Room';
comment on column ng911.addresspoints.seat is 'Seat';
comment on column ng911.addresspoints.addtl_loc is 'Additional Location Information';
comment on column ng911.addresspoints.landmkname is 'Complete Landmark Name';
comment on column ng911.addresspoints.mile_post is 'Mile Post';
comment on column ng911.addresspoints.place_type is 'Place Type';
comment on column ng911.addresspoints.placement is 'Placement Method';
comment on column ng911.addresspoints.long is 'Longitude';
comment on column ng911.addresspoints.lat is 'Latitude';
comment on column ng911.addresspoints.elev is 'Elevation';

/* Creating PSAP Boundary */

create table ng911.psap_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        es_nguid varchar(254),
        state varchar(2),
        agency_id varchar(100),
        serviceuri varchar(254),
        serviceurn varchar(50),
        servicenum varchar(15),
        avcard_uri varchar(254),
        dsplayname varchar(60)
);

comment on table ng911.psap_boundary is 'The primary use for the PSAP Boundary is to route call/emergency requests for NG9-1-1. This layer depicts the polygon(s) and related attribute information that defines the geographic area of all PSAP boundaries within a given 9-1-1 Authority’s geographic coverage area';
comment on column ng911.psap_boundary.id is 'Primary Key'; 
comment on column ng911.psap_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column ng911.psap_boundary.dateupdate is 'Date Updated';
comment on column ng911.psap_boundary.effective is 'Effective Date';
comment on column ng911.psap_boundary.expire is 'Expiration Date';
comment on column ng911.psap_boundary.es_nguid is 'Emergency Service Boundary NENA Globally Unique ID';
comment on column ng911.psap_boundary.state is 'State';
comment on column ng911.psap_boundary.agency_id is 'Agency ID';
comment on column ng911.psap_boundary.serviceuri is 'Service URI';
comment on column ng911.psap_boundary.serviceurn is 'Service URN';
comment on column ng911.psap_boundary.servicenum is 'Service Number';
comment on column ng911.psap_boundary.avcard_uri is 'Agency vCard URI';
comment on column ng911.psap_boundary.dsplayname is 'Display Name';

/* Create emergency Service Boundary */ 

create table ng911.emergency_service_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        es_nguid varchar(254),
        state varchar(2),
        agency_id varchar(100),
        serviceuri varchar(254),
        serviceurn varchar(50),
        servicenum varchar(15),
        avcard_uri varchar(254),
        dsplayname varchar(60)
);

comment on column ng911.psap_boundary.id is 'Primary Key'; 
comment on column ng911.emergency_service_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column ng911.emergency_service_boundary.dateupdate is 'Date Updated';
comment on column ng911.emergency_service_boundary.effective is 'Effective Date';
comment on column ng911.emergency_service_boundary.expire is 'Expiration Date';
comment on column ng911.emergency_service_boundary.es_nguid is 'Emergency Service Boundary NENA Globally Unique ID';
comment on column ng911.emergency_service_boundary.state is 'State';
comment on column ng911.emergency_service_boundary.agency_id is 'Agency ID';
comment on column ng911.emergency_service_boundary.serviceuri is 'Service URI';
comment on column ng911.emergency_service_boundary.serviceurn is 'Service URN';
comment on column ng911.emergency_service_boundary.servicenum is 'Service Number';
comment on column ng911.emergency_service_boundary.avcard_uri is 'Agency vCard URI';
comment on column ng911.emergency_service_boundary.dsplayname is 'Display Name';

/* Create Provisioning Boundary */ 

create table ng911.provisioning_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        pb_nguid varchar(254),
);

comment on column ng911.provisioning_boundary.id is 'Primary Key'; 
comment on column ng911.provisioning_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column ng911.provisioning_boundary.dateupdate is 'Date Updated';
comment on column ng911.provisioning_boundary.effective is 'Effective Date';
comment on column ng911.provisioning_boundary.expire is 'Expiration Date';
comment on column ng911.provisioning_boundary.pb_nguid is 'Expiration Date';

/* Create Street Name Alias Table */

create table nena.street_name_alias_tbl as (
        id serial primary key,
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        ast_nguid varchar(254),
        rcl_nguid varchar(254),
        ast_premod varchar(15),
        ast_predir varchar(9),
        ast_pretyp varchar(50),
        ast_presep varchar(20),
        ast_name varchar(60),
        ast_postyp varchar(50),
        ast_posdir varchar(9),
        ast_posmod varchar(25),
        alstpredir varchar(2),
        alstname varchar(75),
        alsttyp varchar(4),
        alstposdir varchar(2)
);

comment on column ng911.street_name_alias_tbl.id is 'Primary Key'; 
comment on column ng911.street_name_alias_tbl.discrpagid is 'Discrepancy Agency ID';
comment on column ng911.street_name_alias_tbl.dateupdate is 'Date Updated';
comment on column ng911.street_name_alias_tbl.effective is 'Effective Date';
comment on column ng911.street_name_alias_tbl.expire is 'Expiration Date';
comment on column ng911.street_name_alias_tbl.ast_nguid is 'Alias Street Name NENA Globally Unique ID'; 
comment on column ng911.street_name_alias_tbl.rcl_nguid is 'Road Centerline NENA Globally Unique';
comment on column ng911.street_name_alias_tbl.ast_premod is 'Alias Street Name Pre Modifier';
comment on column ng911.street_name_alias_tbl.ast_predir is 'Alias Street Name Pre Directional';
comment on column ng911.street_name_alias_tbl.ast_pretyp is 'Alias Street Name Pre Type';
comment on column ng911.street_name_alias_tbl.ast_presep is 'Alias Street Name Pre Type Separator';
comment on column ng911.street_name_alias_tbl.ast_name is 'Alias Street Name';
comment on column ng911.street_name_alias_tbl.ast_postyp is 'Alias Street Name Post Type';
comment on column ng911.street_name_alias_tbl.ast_posdir is 'Alias Street Name Post Directional';
comment on column ng911.street_name_alias_tbl.ast_posmod is 'Alias Street Name Post Modifier';
comment on column ng911.street_name_alias_tbl.alstpredir is 'Alias Legacy Street Name Pre';
comment on column ng911.street_name_alias_tbl.alstname is 'Alias Legacy Street Name'; 
comment on column ng911.street_name_alias_tbl.alsttyp is 'Alias Legacy Street Name Type';
comment on column ng911.street_name_alias_tbl.alstposdir is 'Alias Legacy Street Name Post';

/*create landmark name alias table */ 
create table nena.landmark_name_alias_tbl as (
        id serial primary key,
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        ACLMNNGUID varchar(254),
        Site_NGUID varchar(254),
        ACLandmark varchar(150)
);

comment on column ng911.landmark_name_alias_tbl.id is 'Primary Key'; 
comment on column ng911.landmark_name_alias_tbl.discrpagid is 'DiscrpAgID';
comment on column ng911.landmark_name_alias_tbl.dateupdate is 'DateUpdate';
comment on column ng911.landmark_name_alias_tbl.effective is 'Effective ';
comment on column ng911.landmark_name_alias_tbl.expire is 'Expire';
comment on column ng911.landmark_name_alias_tbl.ACLMNNGUID is 'ACLMNNGUID';
comment on column ng911.landmark_name_alias_tbl.Site_NGUID is 'Site_NGUID';
comment on column ng911.landmark_name_alias_tbl.ACLandmark is 'ACLandmark';

/*create landmark name part table */ 

create table nena.landmark_name_part_tbl as (
        id serial primary key,
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        lmnp_nguid varchar(254),
        site_nguid varchar(254),
        aclmnnguid varchar(254),
        lmnamepart varchar(150),
        lmnp_order varchar(1)
);

comment on column ng911.landmark_name_part_tbl.id is 'Primary Key'; 
comment on column ng911.landmark_name_part_tbl.discrpagid is 'Discrepancy Agency ID';
comment on column ng911.landmark_name_part_tbl.dateupdate is 'Date Updated';
comment on column ng911.landmark_name_part_tbl.effective is 'Effective Date';
comment on column ng911.landmark_name_part_tbl.expire is 'Expiration Date';
comment on column ng911.landmark_name_part_tbl.lmnp_nguid is 'Landmark Name Part NENA Globally Unique ID';
comment on column ng911.landmark_name_part_tbl.site_nguid is 'Site NENA Globally Unique ID';
comment on column ng911.landmark_name_part_tbl.aclmnnguid is 'Alias Complete Landmark Name NENA Globally Unique ID';
comment on column ng911.landmark_name_part_tbl.lmnamepart is 'Landmark Name Part';
comment on column ng911.landmark_name_part_tbl.lmnp_order is 'Landmark Name Part Order';

/* create state table */

create table nena.states as (
        id serial primary key,
        geom geometry (polygon, 4326),
	discrpagid char(75), 
	dateupdate timestamp, 
	effective timestamp, 
	expire timestamp, 
	statenguid char(254), 
	country char(2), 
	state char(2) 
); 


/*create county table */ 

create table nena.counties as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        cntynguid char(254),
        country char(2),
        state char(2),
        county char(75)
);


/* create municipal boundary */ 

create table nena.incorporated_municipal_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        incm_nguid char(254),
        country char(2),
        state char(2),
        county char(75),
        addcode char(6),
        inc_muni char(100)
);

/* create community boundary */ 

create table nena.neighborhood_community_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        statenguid char(254),
        country char(2),
        state char(2),
        county char(75),
        addcode char(6),
        inc_muni char(100),
        uninc_comm char(100),
        nbrhd_comm chat(100)
);

/* create neighborhood boundary */ 

create table nena.neighborhood_community_boundary as (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        statenguid char(254),
        country char(2),
        state char(2),
        county char(75),
        addcode char(6),
        inc_muni char(100),
        uninc_comm char(100),
        nbrhd_comm chat(100)
);

/* create railroad table */ 

create table nena.railroads as (
	id serial primary key,
	geom geometry (polyline, 4326),
	dateupdate timestamp,
	RS_NGUID char(254),
	RLOWN char(100),
	RLOP char(100),
	RLNAME char(100),
	RMPL double precision,
	RMPH double precision
);

/* create hydrology line table */

create table nena.hydrology_lines as ( 
	id serial primary key, 
	geom geometry (polyline, 4326),
	discrpagid char(75) not null, 
	dateupdate timestamp, 
	hs_nguid char(254), 
	hs_type char(100), 
	hs_name char(100) 
); 

/* create hydrology polygon table */ 

create table nena.hydrology_polygons as (
	id serial primary key,
	geom geometry (polygon, 4326),
	discrpagid char(75) not null,
	dateupdate timestamp,
	hs_nguid char(254),
	hs_type char(100),
	hs_name char(100)
);

/* create cell sector table */ 

create table nena.cell_sector_location as (
	id serial primary key,
	geom geometry (point, 4326),
	discrpagid char(75) not null,
	dateupdate timestamp,
	country char(2),
	state char(2),
	county char(75),
	cell_nguid char(254),
	site_id char(10),
	sector_id char(4),
	switch_id char(10),
	cmarket_id char(10),
	csite_name char(10),
	esrd_esrk char(10),
	esrk_last char(10),
	csctr_ornt char(4),
	technology char(10),
	site_nguid char(254),
	long double precision,
	lat double precision,
);

/* create mile marker */ 

create table nena.mile_marker as (
        id serial primary key,
        geom geometry (points, 4326),
        discrpagid char(75) NOT NULL,
        dateupdate timestamp,
        MileMNGUID char(254),
        MileM_Unit char(15),
        MileMValue double precision,
        MileM_Rte char(100),
        MileM_Type char(15),
        MileM_Ind char(1)
);





