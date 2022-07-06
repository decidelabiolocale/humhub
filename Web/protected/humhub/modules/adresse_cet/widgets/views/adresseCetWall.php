<?php

use yii\helpers\Html;
?>

<div class="panel panel-default">
    <div class="panel-body">

        <div class="media">
            <div class="media-body">
                <h4 class="media-heading"><?= Html::encode($adresse_cet->name); ?> </h4>
                <h5>Type : <?= Html::encode($adresse_cet->type); ?></h5>
            </div>
        </div>

    </div>
</div>
