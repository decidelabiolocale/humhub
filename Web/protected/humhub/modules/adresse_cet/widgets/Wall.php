<?php

namespace humhub\modules\adresse_cet\widgets;

use yii\base\Widget;

class Wall extends Widget
{

    public $adresse_cet;

    public function run()
    {
        return $this->render('adresseCetWall', ['adresse_cet' => $this->adresse_cet]);
    }

}
