<?php

namespace humhub\modules\cet_produit;

use yii\base\BaseObject;
use humhub\modules\cet_produit\models\CetProduit;
use Yii;


class Events extends BaseObject
{
    public static function onSearchRebuild($event)
    {
        print 'onSearchRebuild adresse cet' . "\n";
        foreach (CetProduit::find()->each() as $adresseCet) {
            Yii::$app->search->add($adresseCet);
            print $adresseCet->name . "added \n";
        }
    }

}
