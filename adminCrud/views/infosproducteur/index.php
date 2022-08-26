<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\models\cetcal_model\Infosproducteur;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search_model\InfosproducteurSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Infosproducteurs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="infosproducteur-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Infosproducteur', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'prod_inscrit',
            'fournisseur_cet',
            'niv_certif_ab',
            //'orgcertifbio',
            //'urlcertifab',
            //'surfacehectterres',
            //'surfacesousserre',
            //'tetes_betail',
            //'hl_par_an',
            'id',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Infosproducteur $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
