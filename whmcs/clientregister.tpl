<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

{include file="$template/pageheader.tpl" title=$LANG.clientregistertitle desc=$LANG.registerintro}

{if $noregistration}

    <div class="alert alert-danger">
        <p>{$LANG.registerdisablednotice}</p>
    </div>

{else}

{if $errormessage}
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$errormessage}
    </ul>
</div>
{/if}

<form method="post" action="{$systemsslurl}register.php" class="form-stacked">
<input class="form-control" type="hidden" name="register" value="true" />
<div class="col-md-6">
    <div class="form-group">
	    <label for="firstname">{$LANG.clientareafirstname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="firstname" id="firstname" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="lastname">{$LANG.clientarealastname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="lastname" id="lastname" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="companyname">{$LANG.clientareacompanyname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="companyname" id="companyname" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="email">{$LANG.clientareaemail}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="email" id="email" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="password">{$LANG.clientareapassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="password" id="password" value="{$clientpassword}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="password2">{$LANG.clientareaconfirmpassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="password2" id="password2" value="{$clientpassword2}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="passstrength">{$LANG.pwstrength}</label>
		<div class="controls">
            {include file="$template/pwstrength.tpl"}
		</div>
	</div>
</div>
<div class="col-md-6">

    <div class="form-group">
	    <label for="address1">{$LANG.clientareaaddress1}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address1" id="address1" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="address2">{$LANG.clientareaaddress2}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address2" id="address2" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="city">{$LANG.clientareacity}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="city" id="city" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="state">{$LANG.clientareastate}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="state" id="state" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="postcode">{$LANG.clientareapostcode}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="postcode" id="postcode" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label for="country">{$LANG.clientareacountry}</label>
		<div class="controls">
		    {$clientcountriesdropdown}
		</div>
	</div>

    <div class="form-group">
	    <label for="phonenumber">{$LANG.clientareaphonenumber}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

{if $currencies}
    <div class="form-group">
	    <label for="currency">{$LANG.choosecurrency}</label>
		<div class="controls" id="currency">
		    <select name="currency">
            {foreach from=$currencies item=curr}
            <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
            {/foreach}
            </select>
		</div>
	</div>
{/if}

{foreach key=num item=customfield from=$customfields}
    <div class="form-group">
	    <label for="customfield{$customfield.id}">{$customfield.name}</label>
		<div class="controls">
		    {$customfield.input} {$customfield.description}
		</div>
	</div>
{/foreach}

{if $securityquestions}
    <div class="form-group">
	    <label for="securityqans">{$LANG.clientareasecurityquestion}</label>
		<div class="controls">
		    <select name="securityqid" id="securityqid">
            {foreach key=num item=question from=$securityquestions}
            	<option value={$question.id}>{$question.question}</option>
            {/foreach}
            </select>
		</div>
	</div>
    <div class="form-group">
	    <label for="securityqans">{$LANG.clientareasecurityanswer}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="securityqans" id="securityqans" />
		</div>
	</div>
{/if}

{if $capatacha}
    <div class="form-group">
	    <label>{$LANG.captchatitle}</label>
		<div class="controls row">
			{if $capatacha eq "recaptcha"}
			{$recapatchahtml}
			{else}
			<div class="col-md-6"><input class="form-control" type="text" name="code" size="10" maxlength="5" /></div>
			<div class="col-md-6"><img src="includes/verifyimage.php" align="middle" /></div>
			{/if}
		</div>
	</div>
{/if}


{if $accepttos}
<div class="form-group">
    <label id="tosagree"></label>
    <div class="controls">
        <label class="checkbox">
            <input class="form-control" type="checkbox" name="accepttos" id="accepttos" value="on" >
            {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
        </label>
    </div>
</div>
{/if}

<input class="btn btn-lg btn-primary" type="submit" value="{$LANG.clientregistertitle}" />
</div>
</form>

{/if}
<div class="clearfix"></div>