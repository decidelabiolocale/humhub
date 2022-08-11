<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search_model\InfosproducteurSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="infosproducteur-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'prod_inscrit') ?>

    <?= $form->field($model, 'fournisseur_cet') ?>

    <?= $form->field($model, 'niv_certif_ab') ?>

    <?= $form->field($model, 'orgcertifbio') ?>

    <?= $form->field($model, 'urlcertifab') ?>

    <?php // echo $form->field($model, 'surfacehectterres') ?>

    <?php // echo $form->field($model, 'surfacesousserre') ?>

    <?php // echo $form->field($model, 'tetes_betail') ?>

    <?php // echo $form->field($model, 'hl_par_an') ?>

    <?php // echo $form->field($model, 'id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
