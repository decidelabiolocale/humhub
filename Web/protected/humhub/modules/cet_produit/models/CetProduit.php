<?php

namespace app\humhub\modules\cet_produit\models;

use Yii;

/**
 * This is the model class for table "cet_produit".
 *
 * @property int $id
 * @property string|null $categorie
 * @property string|null $nom
 *
 * @property CetJoinProduit[] $cetJoinProduits
 * @property CetEntite[] $fkAdresseCets
 */
class CetProduit extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cet_produit';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id'], 'integer'],
            [['categorie', 'nom'], 'string', 'max' => 128],
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
            'categorie' => 'Categorie',
            'nom' => 'Nom',
        ];
    }

    /**
     * Gets query for [[CetJoinProduits]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetJoinProduits()
    {
        return $this->hasMany(CetJoinProduit::className(), ['Fk_produit' => 'id']);
    }

    /**
     * Gets query for [[FkAdresseCets]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkAdresseCets()
    {
        return $this->hasMany(CetEntite::className(), ['id' => 'Fk_adresse_cet'])->viaTable('cet_join_produit', ['Fk_produit' => 'id']);
    }
}
