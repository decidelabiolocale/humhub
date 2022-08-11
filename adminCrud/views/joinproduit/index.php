<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\models\cetcal_model\Joinproduit;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search_model\JoinproduitSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Joinproduits';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="joinproduit-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Joinproduit', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Fk_adresse_cet',
            'Fk_produit',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Joinproduit $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit]);
                 }
            ],
        ],
    ]); ?>


</div>
