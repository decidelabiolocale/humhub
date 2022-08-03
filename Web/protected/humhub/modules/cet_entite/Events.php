<?php

namespace humhub\modules\cet_entite;

use yii\base\BaseObject;
use humhub\modules\cet_entite\models\CetEntite;
use Yii;


class Events extends BaseObject
{
    public static function onSearchRebuild($event)
    {
        print 'onSearchRebuild adresse cet' . "\n";
        foreach (CetEntite::find()->each() as $cet_entite) {
            Yii::$app->search->add($cet_entite);
            print $cet_entite->name . "added \n";
        }
    }

}
