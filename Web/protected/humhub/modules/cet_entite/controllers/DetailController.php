<?php

namespace humhub\modules\cet_entite\controllers;

use yii\web\Controller;
use humhub\modules\cet_entite\models\CetEntite;

class DetailController extends Controller {

    public function actionIndex($id = '1')
    {
        $cet_entite = CetEntite::find()->where(['id' => $id])->one();
        return $this->render('index', ['cet_entite' => $cet_entite]);
    }
}
