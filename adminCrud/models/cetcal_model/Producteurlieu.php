<?php

namespace app\models\cetcal_model;

use Yii;

/**
 * This is the model class for table "cet_producteur_lieu".
 *
 * @property int $id
 * @property int $Fk_producteur
 * @property int $Fk_lieu
 * @property int $Fk_type
 * @property string|null $nom
 * @property string|null $precisions
 * @property string|null $date
 * @property string|null $Heure_deb
 * @property string|null $Heure_fin
 * @property string|null $jour
 *
 * @property Entite $fkLieu
 * @property Infosproducteur $fkProducteur
 * @property Type $fkType
 */
class Producteurlieu extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cet_producteur_lieu';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Fk_producteur', 'Fk_lieu', 'Fk_type'], 'required'],
            [['Fk_producteur', 'Fk_lieu', 'Fk_type'], 'integer'],
            [['nom'], 'string', 'max' => 256],
            [['precisions'], 'string', 'max' => 1024],
            [['date', 'Heure_deb', 'Heure_fin', 'jour'], 'string', 'max' => 32],
            [['Fk_lieu'], 'exist', 'skipOnError' => true, 'targetClass' =>Entite::className(), 'targetAttribute' => ['Fk_lieu' => 'id']],
            [['Fk_producteur'], 'exist', 'skipOnError' => true, 'targetClass' => Infosproducteur::className(), 'targetAttribute' => ['Fk_producteur' => 'id']],
            [['Fk_type'], 'exist', 'skipOnError' => true, 'targetClass' => Type::className(), 'targetAttribute' => ['Fk_type' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'Fk_producteur' => 'Fk Producteur',
            'Fk_lieu' => 'Fk Lieu',
            'Fk_type' => 'Fk Type',
            'nom' => 'Nom',
            'precisions' => 'Precisions',
            'date' => 'Date',
            'Heure_deb' => 'Heure Deb',
            'Heure_fin' => 'Heure Fin',
            'jour' => 'Jour',
        ];
    }

    /**
     * Gets query for [[FkLieu]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkLieu()
    {
        return $this->hasOne(Entite::className(), ['id' => 'Fk_lieu']);
    }

    /**
     * Gets query for [[FkProducteur]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkProducteur()
    {
        return $this->hasOne(Infosproducteur::className(), ['id' => 'Fk_producteur']);
    }

    /**
     * Gets query for [[FkType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkType()
    {
        return $this->hasOne(Type::className(), ['id' => 'Fk_type']);
    }
}
