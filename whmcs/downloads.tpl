{include file="$template/pageheader.tpl" title=$LANG.downloadstitle}

<form method="post" action="downloads.php?action=search">    <div class="input-group col-md-4">
    <input type="text" name="q" placeholder="Search" class="form-control appendedInputButton" />
        <span class="input-group-btn">
            <button type="submit" class="btn btn-info">{$LANG.searchfilter}</button>
        </span>
    </div>
</form>
<div class="clearfix"></div>

<p>{$LANG.downloadsintrotext}</p>

<br />

{include file="$template/subheader.tpl" title=$LANG.downloadscategories}

<div class="row">
<div class="form-group">
{foreach from=$dlcats item=dlcat}
    <div class="col4">
        <div class="internalpadding">
            <img src="images/folder.gif" /> <a href="{if $seofriendlyurls}downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}" class="fontsize2"><strong>{$dlcat.name}</strong></a> ({$dlcat.numarticles})<br />
            {$dlcat.description}
        </div>
    </div>
{/foreach}
</div>
</div>

{include file="$template/subheader.tpl" title=$LANG.downloadspopular}

{foreach from=$mostdownloads item=download}
<div class="row">
    {$download.type} <a href="{$download.link}" class="fontsize2"><strong>{$download.title}{if $download.clientsonly} <img src="images/padlock.gif" alt="{$LANG.loginrequired}" />{/if}</strong></a><br />
    {$download.description}<br />
    <span class="lighttext">{$LANG.downloadsfilesize}: {$download.filesize}</span>
</div>
{/foreach}

<br />
<br />
<br />