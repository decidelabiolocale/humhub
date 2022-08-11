<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\cetcal_model\Producteurlieu */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Producteurlieus', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="producteurlieu-view">

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
            'id',
            'Fk_producteur',
            'Fk_lieu',
            'Fk_type',
            'nom',
            'precisions',
            'date',
            'Heure_deb',
            'Heure_fin',
            'jour',
        ],
    ]) ?>

</div>
