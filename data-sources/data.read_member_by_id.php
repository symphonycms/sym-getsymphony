<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceread_member_by_id extends SectionDatasource {

		public $dsParamROOTELEMENT = 'read-member-by-id';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'10' => '{$ds-comments-by-stream-id.author}, {$ds-stream-by-id.author}, {$ds-showcase-by-id.system-id}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'member-id',
				'username',
				'name',
				'country'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-comments-by-stream-id.author', '$ds-stream-by-id.author', '$ds-showcase-by-id.system-id');
		}

		public function about() {
			return array(
				'name' => 'Read Member by ID',
				'author' => array(
					'name' => 'Brendan Abbott',
					'website' => 'http://brendan.dev/dev.getsymphony.com',
					'email' => 'brendan@bloodbone.ws'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-10-07T11:48:22+00:00'
			);
		}

		public function getSource() {
			return '3';
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
