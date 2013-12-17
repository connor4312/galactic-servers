<?php
/**
 *
 *   Copyright © 2010-2012 by xhost.ch GmbH
 *
 *   All rights reserved.
 *
 **/
?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="col-md-3">
    <div id="sidebar">
    <?php
        $this->beginWidget('zii.widgets.CPortlet', array(
            'title'=>end($this->breadcrumbs),
            'hideOnEmpty'=>false,
        ));
        $this->widget('application.components.Menu', array(
            'items'=>$this->menu,
            'htmlOptions'=>array('class'=>'operations'),
        ));
        $this->endWidget();
    ?>
    </div><!-- sidebar -->
</div>
<div class="col-md-9">
    <?php echo $content; ?>
</div>
<div class="clearfix"></div>
<?php $this->endContent(); ?>
