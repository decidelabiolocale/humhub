<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search_model\EntiteSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="entite-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'street') ?>

    <?= $form->field($model, 'zip') ?>

    <?= $form->field($model, 'city') ?>

    <?php // echo $form->field($model, 'country') ?>

    <?php // echo $form->field($model, 'state') ?>

    <?php // echo $form->field($model, 'latitude') ?>

    <?php // echo $form->field($model, 'longitude') ?>

    <?php // echo $form->field($model, 'pk') ?>

    <?php // echo $form->field($model, 'id') ?>

    <?php // echo $form->field($model, 'isActive')->checkbox() ?>

    <?php // echo $form->field($model, 'telFixe') ?>

    <?php // echo $form->field($model, 'telMobile') ?>

    <?php // echo $form->field($model, 'email') ?>

    <?php // echo $form->field($model, 'contactPrenom') ?>

    <?php // echo $form->field($model, 'contactNom') ?>

    <?php // echo $form->field($model, 'siret') ?>

    <?php // echo $form->field($model, 'urlWeb') ?>

    <?php // echo $form->field($model, 'urlFb') ?>

    <?php // echo $form->field($model, 'urlIg') ?>

    <?php // echo $form->field($model, 'urlTwitter') ?>

    <?php // echo $form->field($model, 'urlBoutique') ?>

    <?php // echo $form->field($model, 'commentaire') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
