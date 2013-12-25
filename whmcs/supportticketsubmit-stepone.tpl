<div class="page-header">
	<h1>{$LANG.navopenticket}</h1>
</div>

<p>{$LANG.supportticketsheader}</p>

<div class="clearfix margin-top">
	<ul class="media-list">
		{foreach from=$departments item=department}
		<li class="col-md-6 media">
			<a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" title="{$department.name}" class="pull-left">
				<img src="images/emails.gif" alt="email icon">
			</a>
			<div class="media-body">
				<h3 class="media-heading"><a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" title="{$department.name}">{$department.name}</a></h3>
				{if $department.description}<p>{$department.description}</p>{/if}
			</div>
		</li>
		{foreachelse}
		<li>
			<div class="alert alert-info text-center">{$LANG.nosupportdepartments}</div>
		</li>
		{/foreach}
	</ul>
</div>
