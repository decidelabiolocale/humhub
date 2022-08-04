<?php

namespace humhub\modules\cet_entite;

use yii\base\BaseObject;
use Yii;
use app\humhub\modules\cet_entite\models\CetEntite;


class Events extends BaseObject
{
    public static function onSearchRebuild($event)
    {
        print 'onSearchRebuild cet entite' . "\n";
        foreach (CetEntite::find()->each() as $cet_entite) {
            Yii::$app->search->add($cet_entite);
            print $cet_entite->name . "added \n";
        }
    }

}
