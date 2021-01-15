/*taken from NENA-sta-006.1.1-2020_ng9-1-.pdf*/ 

create schema if not exists nena; 

/* create the centerline dataset */ 

create table nena.centerlines ( 
	id serial primary key, 
	geom geometry (linestring, 4326),
	discrpagid varchar(75) NOT NULL, 
	dateupdate timestamp, 
	effective timestamp, 
	expire timestamp, 
	rcl_nguid varchar(254) NOT NULL, 
	adnumpre_l varchar(15), 
	adnumpre_r varchar(15), 
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
	valid_r varchar(1) 
); 

comment on column nena.centerlines.id is 'Primary Key'; 
comment on column nena.centerlines.discrpagid is 'Discrepancy Agency ID'; 
comment on column nena.centerlines.dateupdate is 'Date Updated';
comment on column nena.centerlines.effective is 'Effective Date';
comment on column nena.centerlines.expire is 'Exiration Date ';
comment on column nena.centerlines.rcl_nguid is 'Road Centerline NENA Globally Unique';
comment on column nena.centerlines.adnumpre_l is 'Left Address Number Prefix';
comment on column nena.centerlines.adnumpre_r is 'Right Address Number PRefix';
comment on column nena.centerlines.fromaddr_l is 'Left FROM Address';
comment on column nena.centerlines.toaddr_l is 'Left TO Address';
comment on column nena.centerlines.fromaddr_r is 'Right FROM Address';
comment on column nena.centerlines.toaddr_r is 'Right TO Address';
comment on column nena.centerlines.parity_l is 'Parity Left';
comment on column nena.centerlines.parity_r is 'Parity Right';
comment on column nena.centerlines.st_premod is 'Street Name Pre Modifier';
comment on column nena.centerlines.st_predir is 'Street Name Pre Directional';
comment on column nena.centerlines.st_pretyp is 'Street Name Pre Type';
comment on column nena.centerlines.st_presep is 'Street Name Pre Type Separator';
comment on column nena.centerlines.st_name is 'Street Name';
comment on column nena.centerlines.st_postyp is 'Street Name Post Type';
comment on column nena.centerlines.st_posdir is 'Street Name Post Directional';
comment on column nena.centerlines.st_posmod is 'Street Name Post Modifier';
comment on column nena.centerlines.lst_predir is 'Legacy Street Name Pre Directional'; 
comment on column nena.centerlines.lst_name is 'Legacy Street Name';
comment on column nena.centerlines.lst_type is 'Legacy Street Name Type';
comment on column nena.centerlines.lst_posdir is 'Legacy Street Name Post Directional';
comment on column nena.centerlines.esn_l is 'ESN Left';
comment on column nena.centerlines.esn_r is 'ESN Right';
comment on column nena.centerlines.msagcomm_l is 'MSAG Community Name Left';
comment on column nena.centerlines.msagcomm_r is 'MSAG Community Name Right';
comment on column nena.centerlines.country_l is 'Country Left';
comment on column nena.centerlines.country_r is 'Country Right';
comment on column nena.centerlines.state_l is 'State Left';
comment on column nena.centerlines.state_r is 'State Right';
comment on column nena.centerlines.county_l is 'County Left';
comment on column nena.centerlines.county_r is 'County Right';
comment on column nena.centerlines.addcode_l is 'Additional Code Left';
comment on column nena.centerlines.addcode_r is 'Additional Code Right';
comment on column nena.centerlines.incmuni_l is 'Incorporated Municipality Left';
comment on column nena.centerlines.incmuni_r is 'Incorporated Municipality Right';
comment on column nena.centerlines.uninccom_l is 'Unincorporated Community Left';
comment on column nena.centerlines.uninccom_r is 'Unincorporated Community Right';
comment on column nena.centerlines.nbrhdcom_l is 'Neighborhood Community Left';
comment on column nena.centerlines.nbrhdcom_r is 'Neighborhood Community Right';
comment on column nena.centerlines.postcode_l is 'Postal Code Left';
comment on column nena.centerlines.postcode_r is 'Postal Code Right';
comment on column nena.centerlines.postcomm_l is 'Postal Community Name Left';
comment on column nena.centerlines.postcomm_r is 'Postal Community Name Right';
comment on column nena.centerlines.roadclass is 'Road Class';
comment on column nena.centerlines.oneway is 'One-Way';
comment on column nena.centerlines.speedlimit is 'Speed Limit';
comment on column nena.centerlines.valid_l is 'Validation Left';
comment on column nena.centerlines.valid_r is 'Validation Right';

/* Create Address Table */ 

create table nena.addresspoints (
        id serial primary key,
        geom geometry (point, 4326),
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
        long double precision,
        lat double precision,
        elev integer
);

comment on table nena.addresspoints is 'Site/Structure Address Points ideally represent the location of a site or structure or the location of access to a site or structure. Site/Structure Address Points can also represent landmarks.'; 
comment on column nena.addresspoints.id is 'Primary Key'; 
comment on column nena.addresspoints.discrpagid is 'Discrepancy Agency ID'; 
comment on column nena.addresspoints.dateupdate is 'Date Updated'; 
comment on column nena.addresspoints.effective is 'Effective Date'; 
comment on column nena.addresspoints.expire is 'Expiration Date';  
comment on column nena.addresspoints.site_nguid is 'Site NENA Globally Unique ID';
comment on column nena.addresspoints.country is 'Country';
comment on column nena.addresspoints.state is 'State';
comment on column nena.addresspoints.county is 'County';
comment on column nena.addresspoints.addcode is 'Additional Code';
comment on column nena.addresspoints.adddatauri is 'Additional Data URI';
comment on column nena.addresspoints.inc_muni is 'Incorporated Municipality';
comment on column nena.addresspoints.uninc_comm is 'Unincorporated Community';
comment on column nena.addresspoints.nbrhd_comm is 'Neighborhood Community';
comment on column nena.addresspoints.addnum_pre is 'Address Number Prefix';
comment on column nena.addresspoints.add_number is 'Address Number';
comment on column nena.addresspoints.addnum_suf is 'Address Number Suffix';
comment on column nena.addresspoints.st_premod is 'Street Name Pre Modifier';
comment on column nena.addresspoints.st_predir is 'Street Name Pre Directional';
comment on column nena.addresspoints.st_pretyp is 'Street Name Pre Type';
comment on column nena.addresspoints.st_presep is 'Street Name Pre Type Separator';
comment on column nena.addresspoints.st_name is 'Street Name';
comment on column nena.addresspoints.st_postyp is 'Street Name Post Type';
comment on column nena.addresspoints.st_posdir is 'Street Name Post Directional';
comment on column nena.addresspoints.st_posmod is 'Street Name Post Modifier';
comment on column nena.addresspoints.lst_predir is 'Legacy Street Name Pre Directional';
comment on column nena.addresspoints.lst_name is 'Legacy Street Name';
comment on column nena.addresspoints.lst_type is 'Legacy Street Name Type';
comment on column nena.addresspoints.lst_posdir is 'Legacy Street Name Post Directional';
comment on column nena.addresspoints.esn is 'ESN';
comment on column nena.addresspoints.msagcomm is 'MSAG Community Name';
comment on column nena.addresspoints.post_comm is 'Postal Community Name';
comment on column nena.addresspoints.post_code is 'Postal Code';
comment on column nena.addresspoints.post_code4 is 'ZIP Plus 4';
comment on column nena.addresspoints.building is 'Building';
comment on column nena.addresspoints.floor is 'Floor';
comment on column nena.addresspoints.unit is 'Unit';
comment on column nena.addresspoints.room is 'Room';
comment on column nena.addresspoints.seat is 'Seat';
comment on column nena.addresspoints.addtl_loc is 'Additional Location Information';
comment on column nena.addresspoints.landmkname is 'Complete Landmark Name';
comment on column nena.addresspoints.mile_post is 'Mile Post';
comment on column nena.addresspoints.place_type is 'Place Type';
comment on column nena.addresspoints.placement is 'Placement Method';
comment on column nena.addresspoints.long is 'Longitude';
comment on column nena.addresspoints.lat is 'Latitude';
comment on column nena.addresspoints.elev is 'Elevation';

/* Creating PSAP Boundary */

create table nena.psap_boundary (
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

comment on table nena.psap_boundary is 'The primary use for the PSAP Boundary is to route call/emergency requests for NG9-1-1. This layer depicts the polygon(s) and related attribute information that defines the geographic area of all PSAP boundaries within a given 9-1-1 Authority’s geographic coverage area';
comment on column nena.psap_boundary.id is 'Primary Key'; 
comment on column nena.psap_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.psap_boundary.dateupdate is 'Date Updated';
comment on column nena.psap_boundary.effective is 'Effective Date';
comment on column nena.psap_boundary.expire is 'Expiration Date';
comment on column nena.psap_boundary.es_nguid is 'Emergency Service Boundary NENA Globally Unique ID';
comment on column nena.psap_boundary.state is 'State';
comment on column nena.psap_boundary.agency_id is 'Agency ID';
comment on column nena.psap_boundary.serviceuri is 'Service URI';
comment on column nena.psap_boundary.serviceurn is 'Service URN';
comment on column nena.psap_boundary.servicenum is 'Service Number';
comment on column nena.psap_boundary.avcard_uri is 'Agency vCard URI';
comment on column nena.psap_boundary.dsplayname is 'Display Name';

/* Create emergency Service Boundary */ 

create table nena.emergency_service_boundary (
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

comment on column nena.psap_boundary.id is 'Primary Key'; 
comment on column nena.emergency_service_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.emergency_service_boundary.dateupdate is 'Date Updated';
comment on column nena.emergency_service_boundary.effective is 'Effective Date';
comment on column nena.emergency_service_boundary.expire is 'Expiration Date';
comment on column nena.emergency_service_boundary.es_nguid is 'Emergency Service Boundary NENA Globally Unique ID';
comment on column nena.emergency_service_boundary.state is 'State';
comment on column nena.emergency_service_boundary.agency_id is 'Agency ID';
comment on column nena.emergency_service_boundary.serviceuri is 'Service URI';
comment on column nena.emergency_service_boundary.serviceurn is 'Service URN';
comment on column nena.emergency_service_boundary.servicenum is 'Service Number';
comment on column nena.emergency_service_boundary.avcard_uri is 'Agency vCard URI';
comment on column nena.emergency_service_boundary.dsplayname is 'Display Name';

/* Create Provisioning Boundary */ 

create table nena.provisioning_boundary (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        pb_nguid varchar(254)
);

comment on column nena.provisioning_boundary.id is 'Primary Key'; 
comment on column nena.provisioning_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.provisioning_boundary.dateupdate is 'Date Updated';
comment on column nena.provisioning_boundary.effective is 'Effective Date';
comment on column nena.provisioning_boundary.expire is 'Expiration Date';
comment on column nena.provisioning_boundary.pb_nguid is 'Expiration Date';

/* Create Street Name Alias Table */

create table nena.street_name_alias_tbl (
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

comment on column nena.street_name_alias_tbl.id is 'Primary Key'; 
comment on column nena.street_name_alias_tbl.discrpagid is 'Discrepancy Agency ID';
comment on column nena.street_name_alias_tbl.dateupdate is 'Date Updated';
comment on column nena.street_name_alias_tbl.effective is 'Effective Date';
comment on column nena.street_name_alias_tbl.expire is 'Expiration Date';
comment on column nena.street_name_alias_tbl.ast_nguid is 'Alias Street Name NENA Globally Unique ID'; 
comment on column nena.street_name_alias_tbl.rcl_nguid is 'Road Centerline NENA Globally Unique';
comment on column nena.street_name_alias_tbl.ast_premod is 'Alias Street Name Pre Modifier';
comment on column nena.street_name_alias_tbl.ast_predir is 'Alias Street Name Pre Directional';
comment on column nena.street_name_alias_tbl.ast_pretyp is 'Alias Street Name Pre Type';
comment on column nena.street_name_alias_tbl.ast_presep is 'Alias Street Name Pre Type Separator';
comment on column nena.street_name_alias_tbl.ast_name is 'Alias Street Name';
comment on column nena.street_name_alias_tbl.ast_postyp is 'Alias Street Name Post Type';
comment on column nena.street_name_alias_tbl.ast_posdir is 'Alias Street Name Post Directional';
comment on column nena.street_name_alias_tbl.ast_posmod is 'Alias Street Name Post Modifier';
comment on column nena.street_name_alias_tbl.alstpredir is 'Alias Legacy Street Name Pre';
comment on column nena.street_name_alias_tbl.alstname is 'Alias Legacy Street Name'; 
comment on column nena.street_name_alias_tbl.alsttyp is 'Alias Legacy Street Name Type';
comment on column nena.street_name_alias_tbl.alstposdir is 'Alias Legacy Street Name Post';

/*create landmark name alias table */ 
create table nena.landmark_name_alias_tbl (
        id serial primary key,
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        ACLMNNGUID varchar(254),
        Site_NGUID varchar(254),
        ACLandmark varchar(150)
);

comment on column nena.landmark_name_alias_tbl.id is 'Primary Key'; 
comment on column nena.landmark_name_alias_tbl.discrpagid is 'DiscrpAgID';
comment on column nena.landmark_name_alias_tbl.dateupdate is 'DateUpdate';
comment on column nena.landmark_name_alias_tbl.effective is 'Effective ';
comment on column nena.landmark_name_alias_tbl.expire is 'Expire';
comment on column nena.landmark_name_alias_tbl.ACLMNNGUID is 'ACLMNNGUID';
comment on column nena.landmark_name_alias_tbl.Site_NGUID is 'Site_NGUID';
comment on column nena.landmark_name_alias_tbl.ACLandmark is 'ACLandmark';

/*create landmark name part table */ 

create table nena.landmark_name_part_tbl (
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

comment on column nena.landmark_name_part_tbl.id is 'Primary Key'; 
comment on column nena.landmark_name_part_tbl.discrpagid is 'Discrepancy Agency ID';
comment on column nena.landmark_name_part_tbl.dateupdate is 'Date Updated';
comment on column nena.landmark_name_part_tbl.effective is 'Effective Date';
comment on column nena.landmark_name_part_tbl.expire is 'Expiration Date';
comment on column nena.landmark_name_part_tbl.lmnp_nguid is 'Landmark Name Part NENA Globally Unique ID';
comment on column nena.landmark_name_part_tbl.site_nguid is 'Site NENA Globally Unique ID';
comment on column nena.landmark_name_part_tbl.aclmnnguid is 'Alias Complete Landmark Name NENA Globally Unique ID';
comment on column nena.landmark_name_part_tbl.lmnamepart is 'Landmark Name Part';
comment on column nena.landmark_name_part_tbl.lmnp_order is 'Landmark Name Part Order';

/* create state table */

create table nena.state (
        id serial primary key,
        geom geometry (polygon, 4326),
	discrpagid varchar(75), 
	dateupdate timestamp, 
	effective timestamp, 
	expire timestamp, 
	statenguid varchar(254), 
	country varchar(2), 
	state varchar(2) 
); 


comment on column nena.state.id is 'Primary Key'; 
comment on column nena.state.discrpagid is 'Discrepancy Agency ID';
comment on column nena.state.dateupdate is 'Date Updated';
comment on column nena.state.effective is 'Effective Date';
comment on column nena.state.expire is 'Expiration Date';
comment on column nena.state.statenguid is 'State NENA Globally Unique ID';
comment on column nena.state.country is 'Country';
comment on column nena.state.state is 'State';

/*create county table */ 

create table nena.county (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        cntynguid varchar(254),
        country varchar(2),
        state varchar(2),
        county varchar(75)
);

comment on column nena.county.id is 'Primary Key'; 
comment on column nena.county.discrpagid is 'Discrepancy Agency ID';
comment on column nena.county.dateupdate is 'Date Updated';
comment on column nena.county.effective is 'Effective Date';
comment on column nena.county.expire is 'Expiration Date';
comment on column nena.county.cntynguid is 'State NENA Globally Unique ID';
comment on column nena.county.country is 'Country';
comment on column nena.county.state is 'State';
comment on column nena.county.county is 'County'; 


/* create municipal boundary */ 

create table nena.incorporated_municipal_boundary (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        incm_nguid varchar(254),
        country varchar(2),
        state varchar(2),
        county varchar(75),
        addcode varchar(6),
        inc_muni varchar(100)
);

comment on column nena.incorporated_municipal_boundary.id is 'Primary Key'; 
comment on column nena.incorporated_municipal_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.incorporated_municipal_boundary.dateupdate is 'Date Updated';
comment on column nena.incorporated_municipal_boundary.effective is 'Effective Date';
comment on column nena.incorporated_municipal_boundary.expire is 'Expiration Date';
comment on column nena.incorporated_municipal_boundary.incm_nguid is 'State NENA Globally Unique ID';
comment on column nena.incorporated_municipal_boundary.country is 'Country';
comment on column nena.incorporated_municipal_boundary.state is 'State';
comment on column nena.incorporated_municipal_boundary.county is 'County'; 
comment on column nena.incorporated_municipal_boundary.addcode is 'Additional Code'; 
comment on column nena.incorporated_municipal_boundary.inc_muni is 'Incorporated Municipality'; 

/* create community boundary */ 

create table nena.neighborhood_community_boundary (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        statenguid varchar(254),
        country varchar(2),
        state varchar(2),
        county varchar(75),
        addcode varchar(6),
        uninc_comm varchar(100)
);

comment on column nena.neighborhood_community_boundary.id is 'Primary Key'; 
comment on column nena.neighborhood_community_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.neighborhood_community_boundary.dateupdate is 'Date Updated';
comment on column nena.neighborhood_community_boundary.effective is 'Effective Date';
comment on column nena.neighborhood_community_boundary.expire is 'Expiration Date';
comment on column nena.neighborhood_community_boundary.statenguid is 'State NENA Globally Unique ID';
comment on column nena.neighborhood_community_boundary.country is 'Country';
comment on column nena.neighborhood_community_boundary.state is 'State';
comment on column nena.neighborhood_community_boundary.county is 'County'; 
comment on column nena.neighborhood_community_boundary.addcode is 'Additional Code'; 
comment on column nena.neighborhood_community_boundary.uninc_comm is 'Unincorporated Municipality'; 


/* create neighborhood boundary */ 

create table nena.neighborhood_boundary (
        id serial primary key,
        geom geometry (polygon, 4326),
        discrpagid varchar(75),
        dateupdate timestamp,
        effective timestamp,
        expire timestamp,
        nbrhdnguid varchar(254),
        country varchar(2),
        state varchar(2),
        county varchar(75),
        addcode varchar(6),
        inc_muni varchar(100),
        uninc_comm varchar(100),
        nbrhd_comm varchar(100)
);
        
comment on column nena.neighborhood_boundary.id is 'Primary Key'; 
comment on column nena.neighborhood_boundary.discrpagid is 'Discrepancy Agency ID';
comment on column nena.neighborhood_boundary.dateupdate is 'Date Updated';
comment on column nena.neighborhood_boundary.effective is 'Effective Date';
comment on column nena.neighborhood_boundary.expire is 'Expiration Date';
comment on column nena.neighborhood_boundary.nbrhdnguid is 'Neighborhood NENA Globally Unique ID';
comment on column nena.neighborhood_boundary.country is 'Country';
comment on column nena.neighborhood_boundary.state is 'State';
comment on column nena.neighborhood_boundary.county is 'County'; 
comment on column nena.neighborhood_boundary.addcode is 'Additional Code';
comment on column nena.neighborhood_boundary.inc_muni is 'Incorporated Municipality';
comment on column nena.neighborhood_boundary.uninc_comm is 'Unincorporated Community';
comment on column nena.neighborhood_boundary.nbrhd_comm is 'Neighborhood Community';

/* create railroad table */ 

create table nena.railroads (
	id serial primary key,
	geom geometry (linestring, 4326),
	dateupdate timestamp,
	rs_nguid char(254),
	rlown char(100),
	rlop char(100),
	rlname char(100),
	rmpl double precision,
	rmph double precision
);

comment on column nena.railroads.id is 'Primary Key'; 
comment on column nena.railroads.dateupdate is 'Date Updated'; 
comment on column nena.railroads.rs_nguid is 'Rail Segment NENA Globally Unique ID'; 
comment on column nena.railroads.rlown is 'Rail Line Owner';
comment on column nena.railroads.rlop is 'Rail Line Operator';
comment on column nena.railroads.rlname is 'Rail Line Name';
comment on column nena.railroads.rmpl is 'Rail Mile Post Low';
comment on column nena.railroads.rmph is 'Rail Mile Post High';

/* create hydrology line table */

create table nena.hydrology_lines ( 
	id serial primary key, 
	geom geometry (linestring, 4326),
	discrpagid char(75) not null, 
	dateupdate timestamp, 
	hs_nguid char(254), 
	hs_type char(100), 
	hs_name char(100) 
); 

comment on column nena.hydrology_lines.id is 'Primary Key'; 
comment on column nena.hydrology_lines.discrpagid is 'Discrepancy Agency ID';
comment on column nena.hydrology_lines.dateupdate is 'Date Updated';
comment on column nena.hydrology_lines.hs_nguid is 'Hydrology Segment NENA Globally Unique ID';
comment on column nena.hydrology_lines.hs_type is 'Hydrology Segment Type';
comment on column nena.hydrology_lines.hs_name is 'Hydrology Segment Name';

/* create hydrology polygon table */ 

create table nena.hydrology_polygons (
	id serial primary key,
	geom geometry (polygon, 4326),
	discrpagid char(75) not null,
	dateupdate timestamp,
	hs_nguid char(254),
	hs_type char(100),
	hs_name char(100)
);

comment on column nena.hydrology_polygons.id is 'Primary Key'; 
comment on column nena.hydrology_polygons.discrpagid is 'Discrepancy Agency ID';
comment on column nena.hydrology_polygons.dateupdate is 'Date Updated';
comment on column nena.hydrology_polygons.hs_nguid is 'Hydrology Polygon NENA Globally Unique ID';
comment on column nena.hydrology_polygons.hs_type is 'Hydrology Polygon Type';
comment on column nena.hydrology_polygons.hs_name is 'Hydrology Polygon Name';

/* create cell sector table */ 

create table nena.cell_sector_location (
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
	lat double precision
);

comment on column nena.cell_sector_location.id is 'Primary Key';
comment on column nena.cell_sector_location.discrpagid is 'Discrepancy Agency ID';
comment on column nena.cell_sector_location.dateupdate is 'Date Updated';
comment on column nena.cell_sector_location.country is 'Country';
comment on column nena.cell_sector_location.state is 'State';
comment on column nena.cell_sector_location.county is 'County';
comment on column nena.cell_sector_location.cell_nguid is 'Cell NENA Globally Unique ID';
comment on column nena.cell_sector_location.site_id is 'Site ID';
comment on column nena.cell_sector_location.sector_id is 'Sector ID';
comment on column nena.cell_sector_location.switch_id is 'Switch ID';
comment on column nena.cell_sector_location.cmarket_id is 'Market ID';
comment on column nena.cell_sector_location.csite_name is 'Cell Site ID';
comment on column nena.cell_sector_location.esrd_esrk is 'ESRD or First ESRK';
comment on column nena.cell_sector_location.esrk_last is 'Last ESRK';
comment on column nena.cell_sector_location.csctr_ornt is 'Sector Orientation';
comment on column nena.cell_sector_location.technology is 'Technology';
comment on column nena.cell_sector_location.site_nguid is 'Site NENA Globally Unique ID';
comment on column nena.cell_sector_location.long is 'Longitude';
comment on column nena.cell_sector_location.lat is 'Latitude';

/* create mile marker */ 

create table nena.mile_marker (
        id serial primary key,
        geom geometry (point, 4326),
        discrpagid char(75) NOT NULL,
        dateupdate timestamp,
        milemnguid char(254),
        milem_unit char(15),
        milemvalue double precision,
        milem_rte char(100),
        milem_type char(15),
        milem_ind char(1)
);

comment on column nena.mile_marker.id is 'Primary Key';
comment on column nena.mile_marker.discrpagid is 'Discrepancy Agency ID';
comment on column nena.mile_marker.dateupdate is 'Date Updated';
comment on column nena.mile_marker.milemnguid is 'Mile Post NENA Globally Unique ID';
comment on column nena.mile_marker.milem_unit is 'Mile Post Unit of Measurement';
comment on column nena.mile_marker.milemvalue is 'Mile Post Measurement Value';
comment on column nena.mile_marker.milem_rte is 'Mile Post Route Name';
comment on column nena.mile_marker.milem_type is 'Mile Post Type';
comment on column nena.mile_marker.milem_ind is 'Mile POst Indicator';

