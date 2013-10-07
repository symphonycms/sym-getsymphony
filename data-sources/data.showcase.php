<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceshowcase extends SectionDatasource {

		public $dsParamROOTELEMENT = 'showcase';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '{$url-page:1}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:creation-date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'system:date',
				'name',
				'link',
				'tags',
				'author'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Showcase',
				'author' => array(
					'name' => 'Brendan Abbott',
					'website' => 'http://brendan.dev/dev.getsymphony.com',
					'email' => 'brendan@bloodbone.ws'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-10-07T11:45:34+00:00'
			);
		}

		public function getSource() {
			return '4';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
