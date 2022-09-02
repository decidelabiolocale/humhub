<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2018 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\search\controllers;

use humhub\modules\user\widgets\Image;
use Yii;
use yii\data\Pagination;
use humhub\components\Controller;
use humhub\modules\space\models\Space;
use humhub\modules\user\models\User;
use humhub\modules\search\models\forms\SearchForm;
use humhub\modules\search\engine\Search;
use humhub\modules\cet_entite\models\CetEntite;
use humhub\modules\cet_produit\models\CetProduit;
use humhub\modules\cet_type\models\CetType;

/**
 * Search Controller provides search functions inside the application.
 *
 * @author Luke
 * @since 0.12
 */
class SearchController extends Controller
{
    /**
     * View context used for the search view
     * @see View::$viewContext
     */
    const VIEW_CONTEXT = 'search';

    /**
     * @var string the current search keyword
     */
    public static $keyword = '';

    /**
     * Display map for the search
     *
     */
    public $displayMap ;
    /**
     * @inheritdoc
     */
    public $showResults = false ;

    public function init()
    {
        $this->appendPageTitle(\Yii::t('SearchModule.base', 'Search'));
        $this->view->setViewContext(static::VIEW_CONTEXT);
        return parent::init();
    }

    /**
     * @inheritdoc
     */
    public function getAccessRules()
    {
        return [
            ['login']
        ];
    }

    public function actionIndex()
    {
        $model = new SearchForm();
        $model->load(Yii::$app->request->get());

        $limitSpaces = [];
        if (!empty($model->limitSpaceGuids)) {
            foreach ($model->limitSpaceGuids as $guid) {
                $space = Space::findOne(['guid' => trim($guid)]);
                if ($space !== null) {
                    $limitSpaces[] = $space;
                }
            }
        }
        $limitTypes = [];
        if (!empty($model->limitTypesIds)) {
            foreach ($model->limitTypesIds as $id) {
                $type = CetType::findOne(['id' => trim($id)]);
                if ($type !== null){
                    $limitTypes[] = $type;
                }
            }
            $this->showResults = true;
        }
        $limitCommunes = [];
        if(!empty($model->limitCommunesIds)) {
            foreach ($model->limitCommunesIds as $id) {
                $commune = CetType::findOne(['id' => trim($id)]);
                if ($commune !== null){
                    $limitCommunes[] = $commune;
                }
            }
            $this->showResults = true;
        }

        $options = [
            'page' => $model->page,
            'sort' => (empty($model->keyword)) ? 'title' : null,
            'pageSize' => Yii::$app->settings->get('paginationSize'),
            'limitSpaces' => $limitSpaces,
            'limitTypes' => $limitTypes
        ];
        $displayMap = false;
        if ($model->scope == SearchForm::SCOPE_CONTENT) {
            $options['type'] = Search::DOCUMENT_TYPE_CONTENT;
        } elseif ($model->scope == SearchForm::SCOPE_SPACE) {
            $options['model'] = Space::class;
        } elseif ($model->scope == SearchForm::SCOPE_USER) {
            $options['model'] = User::class;
        } elseif ($model->scope == SearchForm::SCOPE_CET_ENTITE) {
            $options['model'] = CetEntite::class;
            $displayMap = true;
        } elseif ($model->scope == SearchForm::SCOPE_CET_PRODUIT) {
            $options['model'] = CetProduit::class;
        }
        else {
            $model->scope = SearchForm::SCOPE_ALL;
        }

        $searchResultSet = Yii::$app->search->find($model->keyword, $options);

        // Store static for use in widgets (e.g. fileList)
        self::$keyword = $model->keyword;

        $pagination = new Pagination;
        $pagination->totalCount = $searchResultSet->total;
        $pagination->pageSize = $searchResultSet->pageSize;

        return $this->render('index', [
                    'model' => $model,
                    'results' => $searchResultSet->getResultInstances(),
                    'pagination' => $pagination,
                    'totals' => $model->getTotals($model->keyword, $options),
                    'limitSpaces' => $limitSpaces,
                    'limitTypes' => $limitTypes,
                    'limitCommunes' => $limitCommunes,
                    'displayMap' => $displayMap,
                    'showResults' => $this->showResults
        ]);
    }

}
