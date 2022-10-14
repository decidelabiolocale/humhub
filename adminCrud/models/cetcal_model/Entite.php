<?php

namespace app\models\cetcal_model;

use Yii;

/**
 * This is the model class for table "cet_entite".
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
 * @property bool|null $isActive
 * @property string|null $telFixe
 * @property string|null $telMobile
 * @property string|null $email
 * @property string|null $contactPrenom
 * @property string|null $contactNom
 * @property string|null $siret
 * @property string|null $urlWeb
 * @property string|null $urlFb
 * @property string|null $urlIg
 * @property string|null $urlTwitter
 * @property string|null $urlBoutique
 * @property string|null $commentaire
 *
 * @property Joinproduit[] $cetJoinProduits
 * @property Jointype[] $cetJoinTypes
 * @property Producteurlieu[] $cetProducteurLieus
 * @property Produit[] $fkProduits
 * @property Type[] $fkTypes
 * @property Infosproducteur $pk0
 */
class Entite extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cet_entite';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pk'], 'integer'],
            [['isActive'], 'boolean'],
            [['name', 'street', 'city', 'country', 'state', 'email', 'urlWeb', 'urlFb', 'urlIg', 'urlTwitter', 'urlBoutique'], 'string', 'max' => 256],
            [['type', 'zip', 'siret'], 'string', 'max' => 16],
            [['latitude', 'longitude', 'contactPrenom', 'contactNom'], 'string', 'max' => 64],
            [['telFixe', 'telMobile'], 'string', 'max' => 32],
            [['commentaire'], 'string', 'max' => 1024],
            [['pk'], 'exist', 'skipOnError' => true, 'targetClass' => Infosproducteur::className(), 'targetAttribute' => ['pk' => 'id']],
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
            'id' => 'ID',
            'isActive' => 'Is Active',
            'telFixe' => 'Tel Fixe',
            'telMobile' => 'Tel Mobile',
            'email' => 'Email',
            'contactPrenom' => 'Contact Prenom',
            'contactNom' => 'Contact Nom',
            'siret' => 'Siret',
            'urlWeb' => 'Url Web',
            'urlFb' => 'Url Fb',
            'urlIg' => 'Url Ig',
            'urlTwitter' => 'Url Twitter',
            'urlBoutique' => 'Url Boutique',
            'commentaire' => 'Commentaire',
        ];
    }

    /**
     * Gets query for [[CetJoinProduits]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetJoinProduits()
    {
        return $this->hasMany(Joinproduit::className(), ['Fk_adresse_cet' => 'id']);
    }

    /**
     * Gets query for [[CetJoinTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetJoinTypes()
    {
        return $this->hasMany(Jointype::className(), ['Fk_adresse_cet' => 'id']);
    }

    /**
     * Gets query for [[CetProducteurLieus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetProducteurLieus()
    {
        return $this->hasMany(Producteurlieu::className(), ['Fk_lieu' => 'id']);
    }

    /**
     * Gets query for [[FkProduits]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkProduits()
    {
        return $this->hasMany(Produit::className(), ['id' => 'Fk_produit'])->viaTable('cet_join_produit', ['Fk_adresse_cet' => 'id']);
    }

    /**
     * Gets query for [[FkTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkTypes()
    {
        return $this->hasMany(Type::className(), ['id' => 'Fk_type'])->viaTable('cet_join_type', ['Fk_adresse_cet' => 'id']);
    }

    /**
     * Gets query for [[Pk0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPk0()
    {
        return $this->hasOne(Infosproducteur::className(), ['id' => 'pk']);
    }
}