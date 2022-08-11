<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search_model\ProducteurlieuSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="producteurlieu-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'Fk_producteur') ?>

    <?= $form->field($model, 'Fk_lieu') ?>

    <?= $form->field($model, 'Fk_type') ?>

    <?= $form->field($model, 'nom') ?>

    <?php // echo $form->field($model, 'precisions') ?>

    <?php // echo $form->field($model, 'date') ?>

    <?php // echo $form->field($model, 'Heure_deb') ?>

    <?php // echo $form->field($model, 'Heure_fin') ?>

    <?php // echo $form->field($model, 'jour') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
