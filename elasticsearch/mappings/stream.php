<?php
class elasticsearch_stream {

    public function mapData(Array $data, Entry $entry) {
        $json = array();

        $json['_boost'] = 1;

        $json['title'] = $data['title']['value'];
        $json['content'] = $data['content']['value'];
		$json['type'] = $data['type']['value'];

        return $json;
    }

}