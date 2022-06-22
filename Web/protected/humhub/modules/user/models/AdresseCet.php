<?php

namespace humhub\modules\space\models;

use humhub\modules\search\interfaces\SearchableMap;
/**
 * This is the model class for table "Adresse".
* @property string $street
* @property string $zip
* @property string $city
* @property string $country
* @property string $state
* @property string $name
* @property string $latitude
* @property string $longitude
* @property string $type
* @property integer $pk

**/
class AdresseCet implements SearchableMap
{
	/**
	 *
	 * @param mixed $distance
	 * @param mixed $resultTab
	 *
	 * @return mixed
	 */
	function getResultByDistance($distance, $resultTab) {
	}
}
