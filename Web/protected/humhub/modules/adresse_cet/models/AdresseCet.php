<?php

namespace humhub\modules\adresse_cet\models;

use Yii;
use humhub\modules\search\interfaces\SearchableMap;
use humhub\modules\search\interfaces\Searchable;
use humhub\modules\adresse_cet\widgets\Wall;

/**
 * This is the model class for table "adresse_cet".
 *
 * @property string|null $name
 * @property string|null $type
 * @property string|null $street
 * @property string|null $zip
 * @property string|null $city
 * @property string|null $country
 * @property string|null $state
 * @property string|null $latitude
 * @property string|null $longitude
 * @property int|null $pk
 * @property int $id
 * @property boolean $isActive
 */
class AdresseCet extends \yii\db\ActiveRecord implements SearchableMap, Searchable
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'adresse_cet';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pk'], 'integer'],
            [['name', 'type', 'street', 'city', 'country', 'state'], 'string', 'max' => 255],
            [['zip'], 'string', 'max' => 6],
            [['latitude', 'longitude'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'name' => 'Name',
            'type' => 'Type',
            'street' => 'Street',
            'zip' => 'Zip',
            'city' => 'City',
            'country' => 'Country',
            'state' => 'State',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'pk' => 'Pk',
        ];
    }

    // This is required to display the search result
    public $wallEntryClass = "humhub\modules\adresse_cet\widgets\WallEntry";
    /**
     *
     * @param mixed $distance
     * @param mixed $resultTab
     *
     * @return mixed
     */
    function getResultByDistance($distance, $resultTab)
    {
    }
	/**
	 *
	 * @return mixed
	 */
	function getWallOut() {
        return Wall::widget(['adresse_cet' => $this]);
	}

	/**
	 *
	 * @return mixed
	 */
	function getSearchAttributes() {
        $attributes = [
            'name' => $this->name,
            'type' => $this->type,
            'city' => $this->city
        ];

        return $attributes;
	}
}
