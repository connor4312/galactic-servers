<?php
/**
 *
 *   Copyright © 2010-2012 by xhost.ch GmbH
 *
 *   All rights reserved.
 *
 **/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!--
 -
 -   Copyright © 2010-2012 by xhost.ch GmbH
 -
 -   All rights reserved.
 -
 -->
<head>
	<meta content="initial-scale=1.0, width=device-width, user-scalable=yes" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<link rev="made" href="mailto:multicraft@xhost.ch">
	<meta name="description" content="Multicraft: The Minecraft server control panel">
	<meta name="keywords" content="Multicraft, Minecraft, server, management, control panel, hosting">
	<meta name="author" content="xhost.ch GmbH">

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('screen.css') ?>" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('print.css') ?>" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('ie.css') ?>" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('main.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('form.css') ?>" />

	<link href="replaceme" media="all" rel="stylesheet" type="text/css" />
	<link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="//use.typekit.net/ddx3cat.js"></script>
	<script type="text/javascript">Typekit.load();</script>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>
	<div class="page-wrap">
		<nav class="main navbar navbar-default"> 
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#js-navcollapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Galactic Servers</a>
				</div>
				<div class="collapse navbar-collapse" id="js-navcollapse">
					<div class="navbar-form navbar-right"><a class="btn btn-primary">Buy Now</a></div>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Home</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Pricing <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Minecraft Hosting</a></li>
								<li><a href="#">Dedicated Servers</a></li>
								<li><a href="#">Web Hosting</a></li>
								<li><a href="#">Web Design</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">About <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Why Galactic?</a></li>
								<li><a href="#">Our Team</a></li>
								<li><a href="#">Affiliation</a></li>
								<li><a href="#">Partners</a></li>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Testimonies</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Panel <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Multicraft</a></li>
								<li><a href="#">cPanel</a></li>
								<li><a href="#">Client Area</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="slider">
			<div class="container"><h1>Multicraft Control Panel</h1></div>
		</div>
		<div id="iconbar">
			<div class="container">
				<nav class="navbar navbar-inverse navbar-sub">
					<?php
					$items = array();

					$simple = (Yii::app()->theme && in_array(Yii::app()->theme->name, array('simple', 'mobile', 'platform')));
					if (!$simple)
						$items[] = array('label'=>Yii::t('mc', 'Home'), 'url'=>array('/site/page', 'view'=>'home'));
					if (@Yii::app()->params['installer'] !== 'show')
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Servers'),
							'url'=>array('/server/index', 'my'=>($simple && !Yii::app()->user->isSuperuser() ? 1 : 0)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Users'),
							'url'=>array('/user/index'),
							'visible'=>(Yii::app()->user->isSuperuser()
								|| !(Yii::app()->user->isGuest || (Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Profile'),
							'url'=>array('/user/view', 'id'=>Yii::app()->user->id),
							'visible'=>(!Yii::app()->user->isSuperuser() && !Yii::app()->user->isGuest
								&& ((Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Settings'),
							'url'=>array('/daemon/index'),
							'visible'=>Yii::app()->user->isSuperuser(),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Support'),
							'url'=>array('/site/report'),
							'visible'=>!empty(Yii::app()->params['admin_email']),
						);
					}
					if (Yii::app()->user->isGuest)
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Login'),
							'url'=>array('/site/login'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					else
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Logout ({name})', array('{name}'=>Yii::app()->user->name)),
							'url'=>array('/site/logout'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					$items[] = array(
						'label'=>Yii::t('mc', 'About'),
						'url'=>array('/site/page', 'view'=>'about'),
						'visible'=>$simple,
						'itemOptions'=>array('style'=>'float: right'),
					);
					
					
					$this->widget('zii.widgets.CMenu', array(
						'items'=>$items,
						'htmlOptions' => array('class' => 'nav navbar-nav')
					)); ?>
				</nav>
			</div>
		</div><!-- mainmenu -->

		<div class="container">
			<div class="pagecontent">
			
				<?php
					if (!$simple)
					{
						array_pop($this->breadcrumbs);
						$this->widget('zii.widgets.CBreadcrumbs', array(
							'homeLink'=>'',
							'links'=>$this->breadcrumbs,
							'tagName' => 'ol',
							'htmlOptions' => array('class' => 'breadcrumb'),
							'separator' => '',
							'activeLinkTemplate' => '<li><a href="{url}">{label}</a></li>',
							'inactiveLinkTemplate' => '<li class="active">{label}</li>',
						));
					}
				?>

				<?php echo $content; ?>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="col-md-4"><a>Terms of Service</a></div>
			<div class="col-md-4 text-center">Copyright 2013 by GalacticServers</div>
			<div class="col-md-4 text-right"><a href="http://pyxld.com">Designed</a>. Powered by <a href="http://www.multicraft.org">Multicraft Control Panel</a>.</div>
		</div>
	</footer>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
</body>
</html>
