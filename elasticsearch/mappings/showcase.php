<?php
class elasticsearch_showcase {

    public function mapData(Array $data, Entry $entry) {
        $json = array();

        $json['_boost'] = 1;

        $json['name'] = $data['name']['value'];
        $json['description'] = $data['description']['value'];
		$json['tags'] = $data['tags']['value'];

        return $json;
    }

}