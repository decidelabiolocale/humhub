<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\models\cetcal_model\Entite;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search_model\EntiteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Entites';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="entite-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Entite', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            'type',
            'street',
            'zip',
            'city',
            //'country',
            //'state',
            //'latitude',
            //'longitude',
            //'pk',
            //'id',
            //'isActive:boolean',
            //'telFixe',
            //'telMobile',
            //'email:email',
            //'contactPrenom',
            //'contactNom',
            //'siret',
            //'urlWeb',
            //'urlFb',
            //'urlIg',
            //'urlTwitter',
            //'urlBoutique',
            //'commentaire',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Entite $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
