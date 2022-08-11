<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Jointype */

$this->title = 'Create Jointype';
$this->params['breadcrumbs'][] = ['label' => 'Jointypes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="jointype-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
