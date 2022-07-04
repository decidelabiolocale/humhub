<?php
use yii\base\BaseObject;
use app\models\AdresseCet;


class Events extends BaseObject
{
    public static function onSearchRebuild($event)
    {
        print 'onSearchRebuild adresse cet' . "\n";
        foreach (AdresseCet::find()->each() as $adresseCet) {
            print $adresseCet->name . "\n";
            Yii::$app->search->add($adresseCet);
        }
    }

}
