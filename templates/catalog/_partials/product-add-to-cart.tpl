<div class="product-add-to-cart js-product-add-to-cart">
  {if !$configuration.is_catalog}

    {block name='product_quantity'}
      <div class="product-quantity clearfix">
        <div class="add">
          <button
            class="btn btn-primary add-to-cart"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
          >
            <i class="material-icons shopping-cart">&#xE547;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
          </button>
        </div>

        <div class="vertical-line"> </div>
        
        <div class="product-installment">
          <span class="product-black-bold-text">Calculate your installment</span>
          <span class="product-gray-text">The installment is only ...</span>        
        </div>

        {hook h='displayProductActions' product=$product}
      </div>
    {/block}

    {block name='product_availability'}
      <span id="product-availability" class="js-product-availability">
        {if $product.show_availability && $product.availability_message}
          {if $product.availability == 'available'}
            <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
          {elseif $product.availability == 'last_remaining_items'}
            <i class="material-icons product-last-items">&#xE002;</i>
          {else}
            <i class="material-icons product-unavailable">&#xE14B;</i>
          {/if}
          {$product.availability_message}
        {/if}
      </span>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity js-product-minimal-quantity">
        {if $product.minimal_quantity > 1}
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        {/if}
      </p>
    {/block}
  {/if}
</div>
