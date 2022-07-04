<?php
use humhub\modules\content\widgets\richtext\RichText;
use humhub\modules\content\widgets\stream\WallStreamEntryOptions;


/* @var $adresseCet AdresseCet */
/* @var $renderOptions WallStreamEntryOptions */

$isDetailView = $renderOptions->isViewContext(WallStreamEntryOptions::VIEW_CONTEXT_DETAIL);

?>
<div data-ui-widget="adresseCet.AdresseCet" <?php if(!$isDetailView) : ?>data-state="collapsed"<?php endif; ?> data-ui-init id="adresseCet-content-<?= $adresseCet->id ?>">
    <div data-ui-markdown <?php if(!$isDetailView) : ?>data-ui-show-more<?php endif; ?>>
        <?= RichText::output($adresseCet->name, ['record' => $adresseCet]) ?>
    </div>
</div>
