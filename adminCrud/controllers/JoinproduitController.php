<?php

namespace app\controllers;

use app\models\cetcal_model\Joinproduit;
use app\models\search_model\JoinproduitSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * JoinproduitController implements the CRUD actions for Joinproduit model.
 */
class JoinproduitController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Joinproduit models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new JoinproduitSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Joinproduit model.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_produit Fk Produit
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($Fk_adresse_cet, $Fk_produit)
    {
        return $this->render('view', [
            'model' => $this->findModel($Fk_adresse_cet, $Fk_produit),
        ]);
    }

    /**
     * Creates a new Joinproduit model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Joinproduit();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Joinproduit model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_produit Fk Produit
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($Fk_adresse_cet, $Fk_produit)
    {
        $model = $this->findModel($Fk_adresse_cet, $Fk_produit);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_produit' => $model->Fk_produit]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Joinproduit model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_produit Fk Produit
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($Fk_adresse_cet, $Fk_produit)
    {
        $this->findModel($Fk_adresse_cet, $Fk_produit)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Joinproduit model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_produit Fk Produit
     * @return Joinproduit the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Fk_adresse_cet, $Fk_produit)
    {
        if (($model = Joinproduit::findOne(['Fk_adresse_cet' => $Fk_adresse_cet, 'Fk_produit' => $Fk_produit])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
