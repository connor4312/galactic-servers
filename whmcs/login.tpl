{include file="$template/pageheader.tpl" title=$LANG.login}

<form method="post" action="{$systemsslurl}dologin.php" class="form-stacked col-md-4 col-md-offset-4">
	{if $incorrect}
	<div class="alert alert-danger text-center">
		<p>{$LANG.loginincorrect}</p>
	</div>
	{/if}

	<div class="form-group">
		<label for="username">{$LANG.loginemail}:</label>
		<div class="controls">
			<input class="form-control" name="username" id="username" type="text" />
		</div>
	</div>

	<div class="form-group">
		<label for="password">{$LANG.loginpassword}:</label>
		<div class="controls">
			<input class="form-control" name="password" id="password" type="password"/>
		</div>
	</div>
	<div class="checkbox">
		<label>
			<input type="checkbox" name="rememberme"{if $rememberme} checked="checked"{/if} /> <strong>{$LANG.loginrememberme}</strong>
		</label>
	</div>
	<div class="loginbtn"><input type="submit" class="btn btn-primary btn-large" value="{$LANG.loginbutton}" /></div>
	<br />
	<p><a href="pwreset.php">{$LANG.loginforgotteninstructions}</a></p>
</form>
<div class="clearfix"></div>
<script type="text/javascript">
$("#username").focus();
</script>