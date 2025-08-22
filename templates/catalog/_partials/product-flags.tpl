
{block name='product_flags'}
    <ul class="product-flags js-product-flags">
        {foreach from=$product.flags item=flag}
            {if $flag.type == 'discount'}
                <li class="product-flag {$flag.type}">special offer</li>
            {else}
                <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/if}
        {/foreach}
    </ul>
{/block}
