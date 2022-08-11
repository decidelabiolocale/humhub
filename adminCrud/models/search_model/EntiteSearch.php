<?php

namespace app\models\search_model;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\cetcal_model\Entite;

/**
 * EntiteSearch represents the model behind the search form of `app\models\cetcal_model\Entite`.
 */
class EntiteSearch extends Entite
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'type', 'street', 'zip', 'city', 'country', 'state', 'latitude', 'longitude', 'telFixe', 'telMobile', 'email', 'contactPrenom', 'contactNom', 'siret', 'urlWeb', 'urlFb', 'urlIg', 'urlTwitter', 'urlBoutique', 'commentaire'], 'safe'],
            [['pk', 'id'], 'integer'],
            [['isActive'], 'boolean'],
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
        $query = Entite::find();

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
            'pk' => $this->pk,
            'id' => $this->id,
            'isActive' => $this->isActive,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'street', $this->street])
            ->andFilterWhere(['like', 'zip', $this->zip])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'country', $this->country])
            ->andFilterWhere(['like', 'state', $this->state])
            ->andFilterWhere(['like', 'latitude', $this->latitude])
            ->andFilterWhere(['like', 'longitude', $this->longitude])
            ->andFilterWhere(['like', 'telFixe', $this->telFixe])
            ->andFilterWhere(['like', 'telMobile', $this->telMobile])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'contactPrenom', $this->contactPrenom])
            ->andFilterWhere(['like', 'contactNom', $this->contactNom])
            ->andFilterWhere(['like', 'siret', $this->siret])
            ->andFilterWhere(['like', 'urlWeb', $this->urlWeb])
            ->andFilterWhere(['like', 'urlFb', $this->urlFb])
            ->andFilterWhere(['like', 'urlIg', $this->urlIg])
            ->andFilterWhere(['like', 'urlTwitter', $this->urlTwitter])
            ->andFilterWhere(['like', 'urlBoutique', $this->urlBoutique])
            ->andFilterWhere(['like', 'commentaire', $this->commentaire]);

        return $dataProvider;
    }
}
