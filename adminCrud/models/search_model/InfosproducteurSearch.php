<?php

namespace app\models\search_model;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\cetcal_model\Infosproducteur;

/**
 * InfosproducteurSearch represents the model behind the search form of `app\models\cetcal_model\Infosproducteur`.
 */
class InfosproducteurSearch extends Infosproducteur
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['prod_inscrit', 'fournisseur_cet', 'orgcertifbio', 'urlcertifab', 'surfacehectterres', 'surfacesousserre', 'tetes_betail', 'hl_par_an'], 'safe'],
            [['niv_certif_ab', 'id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Infosproducteur::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'niv_certif_ab' => $this->niv_certif_ab,
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['like', 'prod_inscrit', $this->prod_inscrit])
            ->andFilterWhere(['like', 'fournisseur_cet', $this->fournisseur_cet])
            ->andFilterWhere(['like', 'orgcertifbio', $this->orgcertifbio])
            ->andFilterWhere(['like', 'urlcertifab', $this->urlcertifab])
            ->andFilterWhere(['like', 'surfacehectterres', $this->surfacehectterres])
            ->andFilterWhere(['like', 'surfacesousserre', $this->surfacesousserre])
            ->andFilterWhere(['like', 'tetes_betail', $this->tetes_betail])
            ->andFilterWhere(['like', 'hl_par_an', $this->hl_par_an]);

        return $dataProvider;
    }
}
