<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Entite */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Entites', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="entite-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
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
            'name',
            'type',
            'street',
            'zip',
            'city',
            'country',
            'state',
            'latitude',
            'longitude',
            'pk',
            'id',
            'isActive:boolean',
            'telFixe',
            'telMobile',
            'email:email',
            'contactPrenom',
            'contactNom',
            'siret',
            'urlWeb',
            'urlFb',
            'urlIg',
            'urlTwitter',
            'urlBoutique',
            'commentaire',
        ],
    ]) ?>

</div>
