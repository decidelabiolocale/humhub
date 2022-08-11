<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Infosproducteur */

$this->title = 'Create Infosproducteur';
$this->params['breadcrumbs'][] = ['label' => 'Infosproducteurs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="infosproducteur-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
