<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Producteurlieu */

$this->title = 'Create Producteurlieu';
$this->params['breadcrumbs'][] = ['label' => 'Producteurlieus', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="producteurlieu-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
