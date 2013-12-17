{include file="$template/pageheader.tpl" title=$LANG.clientareanavsupporttickets desc=$LANG.supportticketsintro}

<form method="post" action="supporttickets.php">
    <div class="input-group col-md-4">
        <input type="text" name="q" placeholder="Search" class="form-control appendedInputButton" />
        <span class="input-group-btn">
            <button type="submit" class="btn btn-info">{$LANG.searchfilter}</button>
        </span>
    </div>
</form>
<div class="clearfix"></div>

<div class="resultsbox">
<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>
</div>
<table class="table table-striped table-framed table-centered">
    <thead>
        <tr>
            <th{if $orderby eq "date"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?orderby=date">{$LANG.supportticketsdate}</a></th>
            <th{if $orderby eq "dept"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?orderby=dept">{$LANG.supportticketsdepartment}</a></th>
            <th{if $orderby eq "subject"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?orderby=subject">{$LANG.supportticketssubject}</a></th>
            <th{if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?orderby=status">{$LANG.supportticketsstatus}</a></th>
            <th{if $orderby eq "lastreply"} class="headerSort{$sort}"{/if}><a href="supporttickets.php?orderby=lastreply">{$LANG.supportticketsticketlastupdated}</a></th>
            <th>&nbsp;</th>
        </tr>
    </thead>
    <tbody>
{foreach key=num item=ticket from=$tickets}
        <tr>
            <td>{$ticket.date}</td>
            <td>{$ticket.department}</td>
            <td><div align="left"><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}"><img src="images/article.gif" alt="" border="0" /> {if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></div></td>
            <td>{$ticket.status}</td>
            <td>{$ticket.lastreply}</td>
            <td class="text-center"><a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="btn btn-inverse">{$LANG.supportticketsviewticket}</a></td>
        </tr>
{foreachelse}
        <tr>
            <td colspan="7" class="text-center">{$LANG.norecordsfound}</td>
        </tr>
{/foreach}
    </tbody>
</table>

{include file="$template/clientarearecordslimit.tpl" clientareaaction=$clientareaaction}

<ul class="pager">
    <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}supporttickets.php?page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
    <li class="next{if !$nextpage} disabled{/if}"><a href="{if $nextpage}supporttickets.php?page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
</ul>
