{include file="$template/pageheader.tpl" title=$LANG.clientareanavdetails}

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

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

<form class="form-stacked" method="post" action="{$smarty.server.PHP_SELF}?action=details">

<div class="col-md-6">

    <div class="form-group">
	    <label class="control-label" for="firstname">{$LANG.clientareafirstname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="firstname" id="firstname" value="{$clientfirstname}"{if in_array('firstname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="lastname">{$LANG.clientarealastname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="lastname" id="lastname" value="{$clientlastname}"{if in_array('lastname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="companyname">{$LANG.clientareacompanyname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="companyname" id="companyname" value="{$clientcompanyname}"{if in_array('companyname',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="email">{$LANG.clientareaemail}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="email" id="email" value="{$clientemail}"{if in_array('email',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="blank">&nbsp;</label>
		<div class="controls">
		    &nbsp;
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="paymentmethod">{$LANG.paymentmethod}</label>
		<div class="controls">
		    <select class="form-control" name="paymentmethod" id="paymentmethod">
            <option value="none">{$LANG.paymentmethoddefault}</option>
            {foreach from=$paymentmethods item=method}
            <option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
            {/foreach}
            </select>
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="billingcontact">{$LANG.defaultbillingcontact}</label>
		<div class="controls">
		    <select class="form-control" name="billingcid" id="billingcontact">
            <option value="0">{$LANG.usedefaultcontact}</option>
            {foreach from=$contacts item=contact}
            <option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
            {/foreach}
            </select>
		</div>
	</div>

</div>
<div class="col-md-6">

    <div class="form-group">
	    <label class="control-label" for="address1">{$LANG.clientareaaddress1}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address1" id="address1" value="{$clientaddress1}"{if in_array('address1',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="address2">{$LANG.clientareaaddress2}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address2" id="address2" value="{$clientaddress2}"{if in_array('address2',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="city">{$LANG.clientareacity}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="city" id="city" value="{$clientcity}"{if in_array('city',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="state">{$LANG.clientareastate}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="state" id="state" value="{$clientstate}"{if in_array('state',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="postcode">{$LANG.clientareapostcode}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="postcode" id="postcode" value="{$clientpostcode}"{if in_array('postcode',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="country">{$LANG.clientareacountry}</label>
		<div class="controls">
		    {$clientcountriesdropdown}
		</div>
	</div>

    <div class="form-group">
	    <label class="control-label" for="phonenumber">{$LANG.clientareaphonenumber}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} disabled=""{/if} />
		</div>
	</div>
    {if $emailoptoutenabled}
    <div class="checkbox">
	    <label>
		    <input type="checkbox" value="1" name="emailoptout" id="emailoptout" {if $emailoptout} checked{/if} /> {$LANG.emailoptoutdesc}
		</label>
	</div>
    {/if}

</div>

{if $customfields}
{foreach from=$customfields key=num item=customfield}
    <div class="form-group">
	    <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
		<div class="controls">
		    {$customfield.input} {$customfield.description}
		</div>
	</div>
{/foreach}
{/if}

</fieldset>

<div class="form-actions">
    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
    <input class="btn" type="reset" value="{$LANG.cancel}" />
</div>

</form>
