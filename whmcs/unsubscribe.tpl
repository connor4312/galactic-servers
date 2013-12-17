{include file="$template/pageheader.tpl" title=$LANG.newsletterunsubscribe}

<br />

<div class="halfwidthcontainer">

    {if $successful}
    <div class="alert alert-success">
        <p class="text-center bold">{$LANG.unsubscribesuccess}</p>
    </div>
    <p class="text-center">{$LANG.newsletterremoved}</p>
    {/if}

    {if $errormessage}
    <div class="alert alert-danger">
        <p class="text-center bold">{$LANG.erroroccured}</p>
    </div>
    <p class="text-center">{$errormessage}</p>
    {/if}

    <p class="text-center">{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>

</div>

<br /><br /><br /><br />