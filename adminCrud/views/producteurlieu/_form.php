<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Producteurlieu */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="producteurlieu-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Fk_producteur')->textInput() ?>

    <?= $form->field($model, 'Fk_lieu')->textInput() ?>

    <?= $form->field($model, 'Fk_type')->textInput() ?>

    <?= $form->field($model, 'nom')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'precisions')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'date')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Heure_deb')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Heure_fin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'jour')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
