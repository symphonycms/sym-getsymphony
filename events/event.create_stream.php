<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventcreate_stream extends SectionEvent{

		public $ROOTELEMENT = 'create-stream';

		public $eParamFILTERS = array(
			'xss-fail'
		);

		public static function about(){
			return array(
				'name' => 'Create Stream',
				'author' => array(
					'name' => 'Brendan Abbott',
					'website' => 'http://brendan.dev/dev.getsymphony.com',
					'email' => 'brendan@bloodbone.ws'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-08-21T11:49:00+00:00',
				'trigger-condition' => 'action[create-stream]'
			);
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;create-stream result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/create-stream></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;create-stream result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/create-stream></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;create-stream result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/create-stream></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Topic
    &lt;input name="fields[topic]" type="text" />
  &lt;/label>
  &lt;label>Post
    &lt;textarea name="fields[post]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>State
    &lt;select name="fields[state]">
      &lt;option value="Locked">Locked&lt;/option>
      &lt;option value="Open">Open&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Type
    &lt;select name="fields[type]">
      &lt;option value="Discussion">Discussion&lt;/option>
      &lt;option value="Extension">Extension&lt;/option>
      &lt;option value="Showcase">Showcase&lt;/option>
      &lt;option value="Utility">Utility&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Author
    &lt;input name="fields[author]" type="text" />
  &lt;/label>
  &lt;label>Is this topic pinned?
    &lt;input name="fields[pinned]" type="checkbox" value="yes" />
  &lt;/label>
  &lt;input name="action[create-stream]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://brendan.dev/dev.getsymphony.com/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['create-stream'])) return $this->__trigger();
		}

	}
