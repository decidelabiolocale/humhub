<?php

namespace app\models\search_model;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\cetcal_model\Joinproduit;

/**
 * JoinproduitSearch represents the model behind the search form of `app\models\cetcal_model\Joinproduit`.
 */
class JoinproduitSearch extends Joinproduit
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Fk_adresse_cet', 'Fk_produit'], 'integer'],
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
        $query = Joinproduit::find();

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
            'Fk_adresse_cet' => $this->Fk_adresse_cet,
            'Fk_produit' => $this->Fk_produit,
        ]);

        return $dataProvider;
    }
}
