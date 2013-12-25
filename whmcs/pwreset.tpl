<div class="page-header">
	<h1>{$LANG.pwreset}</h1>
</div>

<div class="row">
	<div class="col-md-6 col-md-offset-3">

{if $success}
	<div class="alert alert-success">
		<h4>{$LANG.pwresetvalidationsent}</h4>
		{$LANG.pwresetvalidationcheckemail}
	</div>
{else}
	{if $errormessage}
	<div class="alert alert-danger alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		{$errormessage}
	</div>
	{/if}

	{if $securityquestion}
	<div class="alert alert-warning">{$LANG.pwresetsecurityquestionrequired}</div>
	<form method="post" action="pwreset.php">
		<input type="hidden" name="action" value="reset">
		<input type="hidden" name="email" value="{$email}">
		<div class="form-group">
			<label for="answer">{$securityquestion}</label>
			<input name="answer" id="answer" type="text" value="{$answer}" class="form-control">
		</div>
		<div class="form-group">
			<input type="submit" class="btn btn-primary" value="{$LANG.pwresetsubmit}">
		</div>
	</form>
	{else}
	<p>{$LANG.pwresetdesc}</p>
	<form method="post" action="pwreset.php" class="form-horizontal">
		<input type="hidden" name="action" value="reset">
		<div class="form-group">
			<label class="col-md-4 control-label" for="email">{$LANG.loginemail}</label>
			<div class="col-md-8">
				<input name="email" id="email" type="text" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-8 col-md-offset-4">
				<button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button>
			</div>
		</div>
	</form>
	{/if}
{/if}
   </div>
</div>
