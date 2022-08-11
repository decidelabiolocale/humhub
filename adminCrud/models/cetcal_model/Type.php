<?php

namespace app\models\cetcal_model;

use Yii;

/**
 * This is the model class for table "cet_type".
 *
 * @property int $id
 * @property string|null $type
 * @property string|null $sous_type
 * @property bool $valide
 *
 * @property Jointype[] $cetJoinTypes
 * @property Producteurlieu[] $cetProducteurLieus
 * @property Entite[] $fkAdresseCets
 */
class Type extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cet_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['valide'], 'boolean'],
            [['type', 'sous_type'], 'string', 'max' => 128],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'sous_type' => 'Sous Type',
            'valide' => 'Valide',
        ];
    }

    /**
     * Gets query for [[CetJoinTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetJoinTypes()
    {
        return $this->hasMany(Jointype::className(), ['Fk_type' => 'id']);
    }

    /**
     * Gets query for [[CetProducteurLieus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCetProducteurLieus()
    {
        return $this->hasMany(Producteurlieu::className(), ['Fk_type' => 'id']);
    }

    /**
     * Gets query for [[FkAdresseCets]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFkAdresseCets()
    {
        return $this->hasMany(Entite::className(), ['id' => 'Fk_adresse_cet'])->viaTable('cet_join_type', ['Fk_type' => 'id']);
    }
}
