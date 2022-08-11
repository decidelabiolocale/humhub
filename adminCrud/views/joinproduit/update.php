<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Joinproduit */

$this->title = 'Update Joinproduit: ' . $model->Fk_adresse_cet;
$this->params['breadcrumbs'][] = ['label' => 'Joinproduits', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Fk_adresse_cet, 'url' => ['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="joinproduit-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
