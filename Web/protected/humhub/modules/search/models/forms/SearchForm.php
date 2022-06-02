<?php

namespace humhub\modules\search\models\forms;

use humhub\modules\user\models\User;
use humhub\modules\space\models\Space;
use humhub\modules\search\engine\Search;
use humhub\modules\user\models\Produit;
use humhub\modules\user\models\LieuxDeVente;
use humhub\modules\user\models\Producteur;
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
    const SCOPE_PRODUIT = 'produit';
    const SCOPE_PRODUCTEUR = 'producteur';
    const SCOPE_LIEUX_DE_VENTE = 'lieux_de_vente';
    const SCOPE_ALL_MAP = 'all_map';
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
        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => Produit::class])) ? Yii::$app->search->find($keyword, array_merge($options, ['model' => Produit::class])) : [];
        $totals[self::SCOPE_PRODUIT] = $searchResultSetCount->total;

        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => Producteur::class])) ? Yii::$app->search->find($keyword, array_merge($options, ['model' => Producteur::class])) : [];
        $totals[self::SCOPE_PRODUCTEUR] = $searchResultSetCount->total;

        $searchResultSetCount = Yii::$app->search->find($keyword, array_merge($options, ['model' => LieuxDeVente::class])) ? Yii::$app->search->find($keyword, array_merge($options, ['model' => LieuxDeVente::class])) : [];
        $totals[self::SCOPE_LIEUX_DE_VENTE] = $searchResultSetCount->total;

        $totals[self::SCOPE_ALL] = $totals[self::SCOPE_CONTENT] + $totals[self::SCOPE_SPACE] + $totals[self::SCOPE_USER] + $totals[self::SCOPE_PRODUIT];

        return $totals;
    }
}
