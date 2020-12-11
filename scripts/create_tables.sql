/*taken from NENA-sta-006.1.1-2020_ng9-1-.pdf*/ 

create schema if not exists ng911; 

/* create the centerline dataset */ 

create table ng911.centerlines as ( 
	id serial primary key, 
	geom geometry (polylines, 4326),
	discrpagid char(75) NOT NULL, 
	dateupdate timestamp, 
	effective timestamp, 
	expire timestamp, 
	rcl_nguid char(254) NOT NULL, 
	adnumpre_l char(15), 
	adnumpre_r char(15), 
	fromaddr_l integer NOT NULL,
	toaddr_l integer NOT NULL, 
	fromaddr_r integer NOT NULL, 
	toaddr_r integer NOT NULL, 
	parity_l char(1) NOT NULL, 
	parity_r char(1) NOT NULL, 
	st_premod char(15), 
	st_predir char(15),
	st_pretyp char(50),
	st_presep char(20),
	st_name char(60) NOT NULL, 
	st_postyp char(50), 
	st_posdir char(9), 
	st_posmod char(25), 
	lst_predir char(2), 
	lst_name char(75), 
	lst_type char(4), 
	lst_posdir char(2), 
	esn_l char(5), 
	esn_r char(5), 
	msagcomm_l char(30), 
	msagcomm_r char(30), 
	country_l char(2) NOT NULL, 
	country_r char(2) NOT NULL, 
	state_l char(2) NOT NULL, 
	state_r char(2) NOT NULL, 
	county_l char(40) NOT NULL, 
	county_r char(40) NOT NULL, 
	addcode_l char(6), 
	addcode_r char(6), 
	incmuni_l char(100) NOT NULL, 
	incmuni_r char(100) NOT NULL, 
	uninccom_l char(100), 
	uninccom_r char(100), 
	nbrhdcom_l char(100), 
	nbrhdcom_r char(100), 
	postcode_l char(7), 
	postcode_r char(7), 
	postcomm_l char(40), 
	postcomm_r char(40), 
	roadclass char(15), 
	oneway char(2), 
        speedlimit char(3), 
	valid_l char(1), 
	valid_r char(1), 
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
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        site_nguid char(254),
        country char(2),
        state char(2),
        county char(40),
        addcode char(6),
        adddatauri char(254),
        inc_muni char(100),
        uninc_comm char(100),
        nbrhd_comm char(100),
        addnum_pre char(15),
        add_number integer,
        addnum_suf char(15),
        st_premod char(15),
        st_predir char(9),
        st_pretyp char(50),
        st_presep char(20),
        st_name char(60),
        st_postyp char(50),
        st_posdir char(9),
        st_posmod char(25),
        lst_predir char(2),
        lst_name char(75),
        lst_type char(4),
        lst_posdir char(2),
        esn char(5),
        msagcomm char(30),
        post_comm char(40),
        post_code char(7),
        post_code4 char(4),
        building char(75),
        floor char(75),
        unit char(75),
        room char(75),
        seat char(75),
        addtl_loc char(225),
        landmkname char(150),
        mile_post char(150),
        place_type char(50),
        placement char(25),
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
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        es_nguid char(254),
        state char(2),
        agency_id char(100),
        serviceuri char(254),
        serviceurn char(50),
        servicenum char(15),
        avcard_uri char(254),
        dsplayname char(60)
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
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        es_nguid char(254),
        state char(2),
        agency_id char(100),
        serviceuri char(254),
        serviceurn char(50),
        servicenum char(15),
        avcard_uri char(254),
        dsplayname char(60)
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
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        pb_nguid char(254),
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
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        ast_nguid char(254),
        rcl_nguid char(254),
        ast_premod char(15),
        ast_predir char(9),
        ast_pretyp char(50),
        ast_presep char(20),
        ast_name char(60),
        ast_postyp char(50),
        ast_posdir char(9),
        ast_posmod char(25),
        alstpredir char(2),
        alstname char(75),
        alsttyp char(4),
        alstposdir char(2)
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
create table nena.landmark_name_alias as (
        id serial primary key,
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        ACLMNNGUID char(254),
        Site_NGUID char(254),
        ACLandmark char(150)
);

comment on column ng911.landmark_name_part_tbl.id is 'Primary Key'; 
comment on column ng911.landmark_name_part_tbl.discrpagid is 'DiscrpAgID';
comment on column ng911.landmark_name_part_tbl.dateupdate is 'DateUpdate';
comment on column ng911.landmark_name_part_tbl.effective is 'Effective ';
comment on column ng911.landmark_name_part_tbl.expire is 'Expire';
comment on column ng911.landmark_name_part_tbl.ACLMNNGUID is 'ACLMNNGUID';
comment on column ng911.landmark_name_part_tbl.Site_NGUID is 'Site_NGUID';
comment on column ng911.landmark_name_part_tbl.ACLandmark is 'ACLandmark';

/*create landmark name part table */ 

create table nena.landmark_name_part_tbl as (
        id serial primary key,
        discrpagid char(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        lmnp_nguid char(254),
        site_nguid char(254),
        aclmnnguid char(254),
        lmnamepart char(150),
        lmnp_order char(1)
);

