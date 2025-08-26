
{if $product.show_price}
  <div class="product-prices js-product-prices">
    {block name='product_price'}
      <div
        class="product-price h5 {if $product.has_discount}has-discount{/if}">
        <div class="product-prices-before-after">
          <div class="current-price">
            <span class='current-price-value' content="{$product.rounded_display_price}">
              {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
              {if '' !== $smarty.capture.custom_price}
                {$smarty.capture.custom_price nofilter}
              {else}
                {$product.price}
              {/if}
            </span>
          </div>
          {block name='product_discount'}
            {if $product.has_discount}
              <div class="product-discount">
                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                <span class="regular-price">{$product.regular_price}</span>
              </div>
            {/if}
          {/block}
        </div>

        {block name='product_unit_price'}
          {if $displayUnitPrice}
            <p class="product-unit-price sub">{$product.unit_price_full}</p>
          {/if}
        {/block}

      </div>
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p class="product-without-taxes">{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p class="product-pack-price"><span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span></p>
      {/if}
    {/block}

    {block name='product_ecotax'}
        {if !$product.is_virtual && $product.ecotax.amount > 0}
        <p class="price-ecotax">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
  </div>
{/if}
