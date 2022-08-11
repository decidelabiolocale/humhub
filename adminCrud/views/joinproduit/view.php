<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Joinproduit */

$this->title = $model->Fk_adresse_cet;
$this->params['breadcrumbs'][] = ['label' => 'Joinproduits', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="joinproduit-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Fk_adresse_cet',
            'Fk_produit',
        ],
    ]) ?>

</div>
