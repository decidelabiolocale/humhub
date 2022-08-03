<?php

use yii\helpers\Html;
?>

<div class="panel panel-default">
    <div class="panel-body">

        <div class="media">
            <div class="media-body">
                <h4 class="media-heading"><?= Html::encode($cet_entite->name); ?> </h4>
                <h5>Type : <?= Html::encode($cet_entite->type); ?></h5>
            </div>
        </div>

    </div>
</div>
