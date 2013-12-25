<div class="page-header">
	<h1>{$LANG.pwreset}</h1>
</div>

<div class="row">
	<div class="col-md-6 col-md-offset-3">
		{if $invalidlink}
		<div class="alert alert-danger">
			{$invalidlink}
		</div>
		{elseif $success}
		<div class="alert alert-success text-center">
			{$LANG.pwresetvalidationsuccess}
		</div>
		<p class="text-center">{$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}</p>
		{else}
		{if $errormessage}
		<div class="alert alert-danger">
			{$errormessage}
		</div>
		{/if}

		<p class="text-center">{$LANG.pwresetenternewpw}</p>
		<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
			<input type="hidden" name="key" id="key" value="{$key}">
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">{$LANG.newpassword}</label>
				<div class="col-md-8">
					<input type="password" name="newpw" id="password" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
				<div class="col-md-8">
					<input type="password" name="confirmpw" id="confirmpw" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="passstrength">{$LANG.pwstrength}</label>
				<div class="col-md-8">
					<div class="form-control-static">{include file="$template/pwstrength.tpl"}</div>
				</div>
			</div>
			<div class="form-group">
				<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
				<input class="btn btn-default" type="reset" value="{$LANG.cancel}">
			</div>
		</form>
		{/if}
	</div>
</div>
