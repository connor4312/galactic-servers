{include file="$template/pageheader.tpl" title=$LANG.clientareanavchangepw}

{include file="$template/clientareadetailslinks.tpl"}

{if $successful}
<div class="alert alert-success">
    <p>{$LANG.changessavedsuccessfully}</p>
</div>
{/if}

{if $errormessage}
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$errormessage}
    </ul>
</div>
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=changepw" class="col-md-4 col-md-offset-4">

    <div class="form-group">
	    <label class="control-label" for="existingpw">{$LANG.existingpassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="existingpw" id="existingpw" />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="password">{$LANG.newpassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="newpw" id="password" />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="confirmpw">{$LANG.confirmnewpassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="confirmpw" id="confirmpw" />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="passstrength">{$LANG.pwstrength}</label>
		<div class="controls">
            {include file="$template/pwstrength.tpl"}
		</div>
	</div>

  <div class="form-actions">
    <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
    <input class="btn" type="reset" value="{$LANG.cancel}" />
  </div>
</form>
<div class="clearfix"></div>