<?php

namespace app\models;

use Yii;
use humhub\modules\search\interfaces\SearchableMap;

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
 */
class AdresseCet extends \yii\db\ActiveRecord implements SearchableMap
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
	/**
	 *
	 * @param mixed $distance
	 * @param mixed $resultTab
	 *
	 * @return mixed
	 */
	function getResultByDistance($distance, $resultTab) {
	}

    function findall() {
        $db = $this->getDb();
        $query = $db->prepare('SELECT * FROM adresse_cet');
        $query->execute();
        return $query->fetchAll();
    }
}
