<?php

namespace app\models\search_model;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\cetcal_model\Producteurlieu;

/**
 * ProducteurlieuSearch represents the model behind the search form of `app\models\cetcal_model\Producteurlieu`.
 */
class ProducteurlieuSearch extends Producteurlieu
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'Fk_producteur', 'Fk_lieu', 'Fk_type'], 'integer'],
            [['nom', 'precisions', 'date', 'Heure_deb', 'Heure_fin', 'jour'], 'safe'],
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
        $query = Producteurlieu::find();

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
            'id' => $this->id,
            'Fk_producteur' => $this->Fk_producteur,
            'Fk_lieu' => $this->Fk_lieu,
            'Fk_type' => $this->Fk_type,
        ]);

        $query->andFilterWhere(['like', 'nom', $this->nom])
            ->andFilterWhere(['like', 'precisions', $this->precisions])
            ->andFilterWhere(['like', 'date', $this->date])
            ->andFilterWhere(['like', 'Heure_deb', $this->Heure_deb])
            ->andFilterWhere(['like', 'Heure_fin', $this->Heure_fin])
            ->andFilterWhere(['like', 'jour', $this->jour]);

        return $dataProvider;
    }
}
