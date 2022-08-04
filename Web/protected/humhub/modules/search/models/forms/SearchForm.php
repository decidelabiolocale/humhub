<?php

namespace humhub\modules\search\models\forms;

use humhub\modules\user\models\User;
use humhub\modules\space\models\Space;
use humhub\modules\search\engine\Search;
use humhub\modules\user\models\Produit;
use humhub\modules\user\models\LieuxDeVente;
use humhub\modules\user\models\Producteur;
use humhub\modules\adresse_cet\models\AdresseCet;
use yii\base\Model;
use Yii;

/**
 * Description of SearchForm
 *
 * @since 1.2
 * @author buddha
 */
class SearchForm extends Model
{
    const SCOPE_ALL = 'all';
    const SCOPE_USER = 'user';
    const SCOPE_SPACE = 'space';
    const SCOPE_CONTENT = 'content';
    const SCOPE_CET_PRODUIT = 'cet_produit';
    const SCOPE_CET_ENTITE = 'cet_entite';
    public $keyword = '';
    public $scope = '';
    public $page = 1;
    public $limitSpaceGuids = [];

    public function init()
    {
        if (Yii::$app->request->get('page')) {
            $this->page = Yii::$app->request->get('page');
        }
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['keyword', 'scope', 'page', 'limitSpaceGuids'], 'safe']
        ];
    }

    public function getTotals($keyword, $options)
    {
        $totals = [];

        // Unset unnecessary search options
        unset($options['model'], $options['type'], $options['page'], $options['pageSize']);

        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => User::class]));
        $totals[self::SCOPE_USER] = $searchResultSetCount->total;
        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => Space::class]));
        $totals[self::SCOPE_SPACE] = $searchResultSetCount->total;

        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['type' => Search::DOCUMENT_TYPE_CONTENT]));
        $totals[self::SCOPE_CONTENT] = $searchResultSetCount->total;
        // TODO: Recherches Cetcal
        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => CetProduit::class])) ? Yii::$app->search->find($keyword, array_merge($options, ['model' => CetProduit::class])) : [];
        $totals[self::SCOPE_CET_PRODUIT] = $searchResultSetCount->total;

        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => CetEntite::class])) ? Yii::$app->search->find($keyword, array_merge($options, ['model' => CetEntite::class])) : [];
        $totals[self::SCOPE_CET_ENTITE] = $searchResultSetCount->total;

        $totals[self::SCOPE_ALL] = $totals[self::SCOPE_CONTENT] + $totals[self::SCOPE_SPACE] + $totals[self::SCOPE_USER] + $totals[self::SCOPE_CET_PRODUIT] + $totals[self::SCOPE_CET_ENTITE];

        return $totals;
    }
}
