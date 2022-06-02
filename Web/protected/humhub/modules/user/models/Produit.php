<?php

namespace humhub\modules\space\models;
use humhub\modules\search\interfaces\Searchable;
use Yii;
use yii\base\Exception;
use yii\db\ActiveQuery;
use yii\db\Expression;

/**
 * This is the model class for table "produit".
 *
 * @property integer $pk_produit
 * @property string $nom
 * @property string $quantite_uni
 * @property string $quantite_mesure
 * @property string $categorie
 * @property string $description
 * @property string $clef_produit
 *
**/
class Produit implements Searchable {



    public static function find()
    {
        return Yii::createObject(Produit::class, [
            'pk_produit' => 1,
            'nom' => 'Produit',
            'quantite_uni' => '1',
            'quantite_mesure' => '1',
            'categorie' => '1',
            'description' => '1',
            'clef_produit' => '1',
        ]);
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
            'categorie' => $this->categorie,
            'description' => $this->description
        ];

        return $attributes;
	}
}
?>
