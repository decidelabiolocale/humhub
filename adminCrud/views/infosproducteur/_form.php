<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Infosproducteur */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="infosproducteur-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'prod_inscrit')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fournisseur_cet')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'niv_certif_ab')->textInput() ?>

    <?= $form->field($model, 'orgcertifbio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlcertifab')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'surfacehectterres')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'surfacesousserre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tetes_betail')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'hl_par_an')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
