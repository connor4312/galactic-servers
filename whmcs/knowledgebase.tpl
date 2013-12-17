{include file="$template/pageheader.tpl" title=$LANG.knowledgebasetitle}

<div class="well">
    <div class="text-center">
        <form method="post" action="knowledgebase.php?action=search" class="form-inline">
            <div class="input-group col-md-6 col-md-offset-3">
        	    <input class="form-control" name="search" type="text" value="{$LANG.kbquestionsearchere}" onfocus="this.value=(this.value=='{$LANG.kbquestionsearchere}') ? '' : this.value;" onblur="this.value=(this.value=='') ? '{$LANG.kbquestionsearchere}' : this.value;"/>
                <span class="input-group-btn">
                    <input type="submit" class="btn btn-large btn-primary" value="{$LANG.knowledgebasesearch}" />
                </span>
        	</div>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

{include file="$template/subheader.tpl" title=$LANG.knowledgebasecategories}

<div class="row">
<div class="form-group">
{foreach name=kbasecats from=$kbcats item=kbcat}
    <div class="col4">
        <div class="internalpadding">
            <img src="images/folder.gif" /> <a href="{if $seofriendlyurls}knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}" class="fontsize2"><strong>{$kbcat.name}</strong></a> ({$kbcat.numarticles})<br />
            {$kbcat.description}
        </div>
    </div>
	{if ($smarty.foreach.kbasecats.index+1) is div by 4}<div class="clear"></div>
    {/if}
{/foreach}
</div>
</div>

{include file="$template/subheader.tpl" title=$LANG.knowledgebasepopular}

{foreach from=$kbmostviews item=kbarticle}
<div class="row">
    <img src="images/article.gif"> <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}" class="fontsize2"><strong>{$kbarticle.title}</strong></a><br />
    {$kbarticle.article|truncate:100:"..."}
</div>
{/foreach}

<br />