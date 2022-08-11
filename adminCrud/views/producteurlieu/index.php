<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\models\cetcal_model\Producteurlieu;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search_model\ProducteurlieuSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Producteurlieus';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="producteurlieu-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Producteurlieu', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'Fk_producteur',
            'Fk_lieu',
            'Fk_type',
            'nom',
            //'precisions',
            //'date',
            //'Heure_deb',
            //'Heure_fin',
            //'jour',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Producteurlieu $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
