<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Joinproduit */

$this->title = 'Create Joinproduit';
$this->params['breadcrumbs'][] = ['label' => 'Joinproduits', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="joinproduit-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
