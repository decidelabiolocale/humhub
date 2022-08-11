<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Entite */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="entite-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'street')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'zip')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'state')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'latitude')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'longitude')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pk')->textInput() ?>

    <?= $form->field($model, 'isActive')->checkbox() ?>

    <?= $form->field($model, 'telFixe')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telMobile')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'contactPrenom')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'contactNom')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'siret')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlWeb')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlFb')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlIg')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlTwitter')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'urlBoutique')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'commentaire')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
