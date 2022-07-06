<?php

namespace humhub\modules\adresse_cet;

use yii\base\BaseObject;
use humhub\modules\adresse_cet\models\AdresseCet;
use Yii;


class Events extends BaseObject
{
    public static function onSearchRebuild($event)
    {
        print 'onSearchRebuild adresse cet' . "\n";
        foreach (AdresseCet::find()->each() as $adresseCet) {
            Yii::$app->search->add($adresseCet);
            print $adresseCet->name . "added \n";
        }
    }

}
