<?php

namespace app\models;

use Yii;
use humhub\modules\search\interfaces\Searchable;

/**
 * This is the model class for table "produit".
 *
 * @property int $id
 * @property string|null $nom
 * @property string|null $categorie
 */
class Produit extends \yii\db\ActiveRecord implements Searchable
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'produit';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id'], 'integer'],
            [['nom', 'categorie'], 'string', 'max' => 100],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nom' => 'Nom',
            'categorie' => 'Categorie',
        ];
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
        $attributes = [
            'nom' => $this->nom,
            'categorie' => $this->categorie
        ];

        return $attributes;
	}
}
