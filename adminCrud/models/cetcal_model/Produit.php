<?php

namespace app\models\cetcal_model;

use Yii;

/**
 * This is the model class for table "cet_produit".
 *
 * @property int $id
 * @property string|null $categorie
 * @property string|null $nom
 * @property bool $valide
 *
 * @property Joinproduit[] $cetJoinProduits
 * @property Entite[] $fkAdresseCets
 */
class Produit extends \yii\db\ActiveRecord
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
            [['valide'], 'boolean'],
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
            'valide' => 'Valide',
        ];
    }

    /**
     * Gets query for [[CetJoinProduits]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetJoinProduits()
    {
        return $this->hasMany(Joinproduit::className(), ['Fk_produit' => 'id']);
    }

    /**
     * Gets query for [[FkAdresseCets]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkAdresseCets()
    {
        return $this->hasMany(Entite::className(), ['id' => 'Fk_adresse_cet'])->viaTable('cet_join_produit', ['Fk_produit' => 'id']);
    }
}
