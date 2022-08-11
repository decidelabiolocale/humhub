<?php

namespace app\controllers;

use app\models\cetcal_model\Jointype;
use app\models\search_model\JointypeSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * JointypeController implements the CRUD actions for Jointype model.
 */
class JointypeController extends Controller
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
     * Lists all Jointype models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new JointypeSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Jointype model.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_type Fk Type
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($Fk_adresse_cet, $Fk_type)
    {
        return $this->render('view', [
            'model' => $this->findModel($Fk_adresse_cet, $Fk_type),
        ]);
    }

    /**
     * Creates a new Jointype model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Jointype();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_type' => $model->Fk_type]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Jointype model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_type Fk Type
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($Fk_adresse_cet, $Fk_type)
    {
        $model = $this->findModel($Fk_adresse_cet, $Fk_type);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Fk_adresse_cet' => $model->Fk_adresse_cet, 'Fk_type' => $model->Fk_type]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Jointype model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_type Fk Type
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($Fk_adresse_cet, $Fk_type)
    {
        $this->findModel($Fk_adresse_cet, $Fk_type)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Jointype model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $Fk_adresse_cet Fk Adresse Cet
     * @param int $Fk_type Fk Type
     * @return Jointype the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Fk_adresse_cet, $Fk_type)
    {
        if (($model = Jointype::findOne(['Fk_adresse_cet' => $Fk_adresse_cet, 'Fk_type' => $Fk_type])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
