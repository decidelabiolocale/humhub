<?php

namespace humhub\modules\space\models;

use humhub\modules\search\behaviors\Searchable;
/**
 * This is the model class for table "producteur".
* @property AdresseCet $adresse
**/
class Producteur implements Searchable
{
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
        $attributes = [
            'nom' => $this->adresse->name,
        ];

        return $attributes;

	}
}
