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
comment on column ng911.addresspoints.discrpagid is '
comment on column ng911.addresspoints.dateupdate is ' 
comment on column ng911.addresspoints.effective is ' 
comment on column ng911.addresspoints.expire is ' 
comment on column ng911.addresspoints.site_nguid is ' 
comment on column ng911.addresspoints.country is '
comment on column ng911.addresspoints.state is '
comment on column ng911.addresspoints.county is '
comment on column ng911.addresspoints.addcode is '
comment on column ng911.addresspoints.adddatauri is '
comment on column ng911.addresspoints.inc_muni is '
comment on column ng911.addresspoints.uninc_comm is '
comment on column ng911.addresspoints.nbrhd_comm is '
comment on column ng911.addresspoints.addnum_pre is '
comment on column ng911.addresspoints.add_number is '
comment on column ng911.addresspoints.addnum_suf is '
comment on column ng911.addresspoints.st_premod is '
comment on column ng911.addresspoints.st_predir is '
comment on column ng911.addresspoints.st_pretyp is '
comment on column ng911.addresspoints.st_presep is '
comment on column ng911.addresspoints.st_name is '
comment on column ng911.addresspoints.st_postyp is '
comment on column ng911.addresspoints.st_posdir is '
comment on column ng911.addresspoints.st_posmod is '
comment on column ng911.addresspoints.lst_predir is '
comment on column ng911.addresspoints.lst_name is '
comment on column ng911.addresspoints.lst_type is '
comment on column ng911.addresspoints.lst_posdir is '
comment on column ng911.addresspoints.esn is '
comment on column ng911.addresspoints.msagcomm is '
comment on column ng911.addresspoints.post_comm is '
comment on column ng911.addresspoints.post_code is '
comment on column ng911.addresspoints.post_code4 is '
comment on column ng911.addresspoints.building is '
comment on column ng911.addresspoints.floor is '
comment on column ng911.addresspoints.unit is '
comment on column ng911.addresspoints.room is '
comment on column ng911.addresspoints.seat is '
comment on column ng911.addresspoints.addtl_loc is '
comment on column ng911.addresspoints.landmkname is '
comment on column ng911.addresspoints.mile_post is '
comment on column ng911.addresspoints.place_type is '
comment on column ng911.addresspoints.placement is '
comment on column ng911.addresspoints.long is '
comment on column ng911.addresspoints.lat is '
comment on column ng911.addresspoints.elev is '
