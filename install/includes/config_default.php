<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '20',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'version' => '2.3.2RC1',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### DATABASE ######
		'database' => array(
			'host' => 'localhost',
			'port' => '3306',
			'user' => null,
			'password' => null,
			'db' => null,
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Symphony Network',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'g:i a',
			'date_format' => 'm/d/Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Los_Angeles',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### DUMP_DB ######
		'dump_db' => array(
			'last_sync' => '2013-02-28T15:48:56-08:00',
			'path' => '/workspace/sql',
			'restore' => 'yes',
		),
		########
	);
