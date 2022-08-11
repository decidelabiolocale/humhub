<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Infosproducteur */

$this->title = 'Update Infosproducteur: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Infosproducteurs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="infosproducteur-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
