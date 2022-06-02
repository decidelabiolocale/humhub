<?php

namespace humhub\modules\space\models;

use humhub\modules\search\interfaces\SearchableMap;

class Producteur implements SearchableMap
{
    public function getResultByDistance($distance, $resultTab)
    {
        return $resultTab;
    }
	/**
	 *
	 * @return mixed
	 */
	function getWallOut() {
	}

	/**
	 *
	 * @return mixed
	 */
	function getSearchAttributes() {
	}
}
