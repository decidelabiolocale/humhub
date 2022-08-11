<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Jointype */

$this->title = 'Update Jointype: ' . $model->Fk_adresse_cet;
$this->params['breadcrumbs'][] = ['label' => 'Jointypes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Fk_adresse_cet, 'url' => ['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_type' => $model->Fk_type]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="jointype-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
