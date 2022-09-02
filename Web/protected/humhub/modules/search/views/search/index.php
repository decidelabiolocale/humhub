<?php

use humhub\modules\content\widgets\stream\StreamEntryWidget;
use humhub\modules\content\widgets\stream\WallStreamEntryOptions;
use humhub\modules\space\widgets\SpacePickerField;
use humhub\modules\cet_type\widgets\TypePickerField;
use humhub\widgets\FooterMenu;
use yii\data\Pagination;
use yii\helpers\Url;
use humhub\libs\Html;
use yii\bootstrap\ActiveForm;
use humhub\modules\search\models\forms\SearchForm;
use humhub\modules\content\components\ContentActiveRecord;
use humhub\modules\content\components\ContentContainerActiveRecord;
use humhub\modules\stream\actions\Stream;
use humhub\widgets\LinkPager;
use humhub\modules\search\interfaces\Searchable;
use humhub\modules\cetcalModule\widgets\MapView;
use humhub\modules\cet_commune\widgets\CommunePickerField;

humhub\modules\stream\assets\StreamAsset::register($this);

/* @var $limitSpaces array */
/* @var $totals array */
/* @var $results array */
/* @var $model SearchForm */
/* @var $pagination Pagination */

?>
<script <?= Html::nonce() ?>>
    $(document).on('humhub:ready', function() {
        $('#search-input-field').focus();

        $('#collapse-search-settings').on('show.bs.collapse', function() {
            // change link arrow
            $('#search-settings-link i').removeClass('fa-caret-right');
            $('#search-settings-link i').addClass('fa-caret-down');
        });

        $('#collapse-search-settings').on('shown.bs.collapse', function() {
            $('#space_input_field').focus();
        })

        $('#collapse-search-settings').on('hide.bs.collapse', function() {
            // change link arrow
            $('#search-settings-link i').removeClass('fa-caret-down');
            $('#search-settings-link i').addClass('fa-caret-right');
        });


        <?php foreach (explode(' ', $model->keyword) as $k) : ?>
            $(".searchResults").highlight("<?= Html::encode($k); ?>");
            $(document).ajaxComplete(function(event, xhr, settings) {
                $(".searchResults").highlight("<?= Html::encode($k); ?>");
            });
        <?php endforeach; ?>
    });
</script>

<div class="container" data-action-component="stream.SimpleStream">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading"><strong><?= Yii::t('base', 'Search'); ?></strong></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <?php $form = ActiveForm::begin(['action' => Url::to(['index']), 'method' => 'GET']); ?>
                            <div class="form-group form-group-search">
                                <?= $form->field($model, 'keyword')->textInput([
                                    'placeholder' => Yii::t('SearchModule.base', 'Search for user, spaces and content'),
                                    'title' => Yii::t('SearchModule.base', 'Search for user, spaces and content'),
                                    'class' => 'form-control form-search', 'id' => 'search-input-field'
                                ])->label(false) ?>
                                <?= Html::submitButton(Yii::t('base', 'Search'), [
                                    'class' => 'btn btn-default btn-sm form-button-search',
                                    'data-ui-loader' => ''
                                ]) ?>
                            </div>

                            <div class="text-center">
                                <a data-toggle="collapse" id="search-settings-link" href="#collapse-search-settings" style="font-size: 11px;">
                                    <i class="fa fa-caret-right"></i> <?= Yii::t('SearchModule.base', 'Advanced search settings') ?>
                                </a>
                            </div>

                            <div id="collapse-search-settings" class="panel-collapse collapse">
                                <br>
                                <p>Rechercher uniquement certains types d'Entités:</p>
                                <?= TypePickerField::widget([
                                    'id' => 'type_filter',
                                    'model' => $model,
                                    'attribute' => 'limitTypesIds',
                                    'selection' => $limitTypes,
                                    'placeholder' => "Préciser vos types"
                                ])
                                ?>
                                <br>
                                <p>Rechercher aux alentours de communes </p>
                                <?= CommunePickerField::widget([
                                    'id' => 'commune_filter',
                                    'model' => $model,
                                    'attribute' => 'limitCommunesIds',
                                    'selection' => $limitCommunes,
                                    'placeholder' => "Préciser vos types"
                                ])
                                ?>
                                <br>
                                <?= Yii::t('SearchModule.base', 'Search only in certain spaces:') ?>
                                <?= SpacePickerField::widget([
                                    'id' => 'space_filter',
                                    'model' => $model,
                                    'attribute' => 'limitSpaceGuids',
                                    'selection' => $limitSpaces,
                                    'placeholder' => Yii::t('SearchModule.base', 'Specify space')
                                ]) ?>
                            </div>
                            <br>
                            <?php ActiveForm::end(); ?>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php if (!empty($model->keyword) || $showResults) : ?>
        <div class="row">
            <div class="col-md-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <?= Yii::t('SearchModule.base', '<strong>Search </strong> results') ?>
                    </div>
                    <div class="list-group">
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_ALL, 'SearchForm[limitTypesIds]' => $model->limitTypesIds, 'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_ALL) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group "><?= Yii::t('SearchModule.base', 'All') ?>
                                    (<?= $totals[SearchForm::SCOPE_ALL] ?>)
                                </div>
                            </div>
                        </a>
                        <br />
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_CONTENT, 'SearchForm[limitTypesIds]' => $model->limitTypesIds, 'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_CONTENT) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group "><?= Yii::t('SearchModule.base', 'Content') ?>
                                    (<?= $totals[SearchForm::SCOPE_CONTENT] ?>)
                                </div>
                            </div>
                        </a>
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_USER, 'SearchForm[limitTypesIds]' => $model->limitTypesIds, 'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_USER) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group "><?= Yii::t('SearchModule.base', 'Users') ?>
                                    (<?= $totals[SearchForm::SCOPE_USER] ?>)
                                </div>
                            </div>
                        </a>
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_SPACE, 'SearchForm[limitTypesIds]' => $model->limitTypesIds, 'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_SPACE) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group "><?= Yii::t('SearchModule.base', 'Spaces') ?>
                                    (<?= $totals[SearchForm::SCOPE_SPACE] ?>)
                                </div>
                            </div>
                        </a>
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_CET_PRODUIT, 'SearchForm[limitTypesIds]' => $model->limitTypesIds,'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_CET_PRODUIT) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group ">Produits
                                    (<?= $totals[SearchForm::SCOPE_CET_PRODUIT] ?>)
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="panel-heading">
                        Résultat sur la map
                    </div>
                    <div class="list-group">
                        <a data-pjax-prevent href='<?= Url::to(['/search/search/index', 'SearchForm[keyword]' => $model->keyword, 'SearchForm[limitSpaceGuids]' => $model->limitSpaceGuids, 'SearchForm[scope]' => SearchForm::SCOPE_CET_ENTITE, 'SearchForm[limitTypesIds]' => $model->limitTypesIds,'SearchForm[limitCommunesIds]' => $model->limitCommunesIds]); ?>' class="list-group-item<?= ($model->scope === SearchForm::SCOPE_CET_ENTITE) ? ' active' : '' ?>">
                            <div>
                                <div class="edit_group "> CetEntite
                                    (<?= $totals[SearchForm::SCOPE_CET_ENTITE] ?>)
                                </div>
                            </div>
                        </a>
                    </div>
                </div>


            </div>
            <div class="col-md-10 row">
                <?php if ($displayMap) : ?>
                    <div class="col-md-8">
                        <?= MapView::widget(['cetEntites' => $results]) ?>
                    </div>
                    <div class="searchResults col-md-4">
                        <?php if (count($results) > 0) : ?>
                            <?php foreach ($results as $result) : ?>
                                <?php try {  ?>
                                    <?php if ($result instanceof ContentActiveRecord) : ?>
                                        <?= StreamEntryWidget::renderStreamEntry(
                                            $result,
                                            (new WallStreamEntryOptions())->viewContext(WallStreamEntryOptions::VIEW_CONTEXT_SEARCH)
                                        ) ?>
                                    <?php elseif ($result instanceof ContentContainerActiveRecord) : ?>
                                        <?= $result->getWallOut() ?>
                                    <?php elseif ($result instanceof Searchable) : ?>
                                        <?= $result->getWallOut() ?>
                                    <?php else : ?>
                                        No Output for Class <?= get_class($result); ?>
                                    <?php endif; ?>
                                <?php } catch (\Throwable $e) {
                                    Yii::error($e);
                                } ?>
                            <?php endforeach; ?>
                        <?php else : ?>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p><strong><?= Yii::t('SearchModule.base', 'Your search returned no matches.') ?></strong></p>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                <?php else : ?>
                    <div class="searchResults">

                        <?php if (count($results) > 0) : ?>
                            <?php foreach ($results as $result) : ?>
                                <?php try {  ?>
                                    <?php if ($result instanceof ContentActiveRecord) : ?>
                                        <?= StreamEntryWidget::renderStreamEntry(
                                            $result,
                                            (new WallStreamEntryOptions())->viewContext(WallStreamEntryOptions::VIEW_CONTEXT_SEARCH)
                                        ) ?>
                                    <?php elseif ($result instanceof ContentContainerActiveRecord) : ?>
                                        <?= $result->getWallOut() ?>
                                    <?php elseif ($result instanceof Searchable) : ?>
                                        <?= $result->getWallOut() ?>
                                    <?php else : ?>
                                        No Output for Class <?= get_class($result); ?>
                                    <?php endif; ?>
                                <?php } catch (\Throwable $e) {
                                    Yii::error($e);
                                } ?>
                            <?php endforeach; ?>
                        <?php else : ?>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p><strong><?= Yii::t('SearchModule.base', 'Your search returned no matches.') ?></strong></p>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                <?php endif; ?>
                <div class="pagination-container"><?= LinkPager::widget(['pagination' => $pagination]) ?></div>
                <br><br>
            </div>


        <?php endif; ?>

        <?= FooterMenu::widget(['location' => FooterMenu::LOCATION_FULL_PAGE]); ?>
        </div>
