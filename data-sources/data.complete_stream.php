<?php

	require_once(EXTENSIONS . '/uniondatasource/data-sources/datasource.union.php');

	Class datasourcecomplete_stream extends UnionDatasource{

		public $dsParamROOTELEMENT = 'complete-stream';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamSTARTPAGE = '{$url-page:1}';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '';

		public $dsParamUNION = array(
			'stream',
			'utilities',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
			'system:pagination'
		);

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Complete Stream',
				'author' => array(
					'name' => 'Brendan Abbott',
					'website' => 'http://brendan.dev/dev.getsymphony.com',
					'email' => 'brendan@bloodbone.ws'),
				'version' => 'Union Datasource Symphony 2.3.3',
				'release-date' => '2013-10-07T01:22:31+00:00'
			);
		}

		public function allowEditorToParse(){
			return true;
		}

	}
