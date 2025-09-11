<nav data-depth="{$breadcrumb.count}" class="breadcrumb">
  <ol>
    {block name='breadcrumb'}
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {block name='breadcrumb_item'}
          <li>
            {if not $smarty.foreach.breadcrumb.last}
              <a href="{$path.url}"><span>{$path.title}</span></a>
              <span class="breadcrumb-separator">></span>
            {else}
              <span>{$path.title}</span>
            {/if}
          </li>
        {/block}
      {/foreach}
    {/block}
  </ol>
</nav>
