
{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

  <section id="main">
    <meta content="{$product.url}">

    <div class="row product-container js-product-container">
      <div class="col-md-6">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {include file='catalog/_partials/product-flags.tpl'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        </div>
        <div class="col-md-6">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="product-information">
            {block name='product_buy_before_info'}
              <div class="product-buy-before-info">Orders paid by 12:00 are shipped the same day</div>
            {/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions js-product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}

                    <div class="product-delivery-time-contact">
                      <div class="product-gray-text">Delivery time: <span class="product-black-bold-text">2-3 days</span></div>
                      <div class="product-gray-text">Ask about the product: 
                        <span class="product-black-bold-text"><a href="mailto:mail@mail.com" class="product-black-bold-text">mail@mail.com</a></span>
                      </div>
                    </div>

                    <div class="product-list-info">
                      <ul>
                        <li class="product-gray-text">
                        <img class="cap-gray" src="https://www.svgrepo.com/show/508373/baseball-cap.svg" alt="cap" width="24" height="24">
                        Fast delivery</li>

                        <li class="product-gray-text">
                        <img class="cap-gray" src="https://www.svgrepo.com/show/508373/baseball-cap.svg" alt="cap" width="24" height="24">
                        30-day warranty</li>

                        <li class="product-gray-text">
                        <img class="cap-gray" src="https://www.svgrepo.com/show/508373/baseball-cap.svg" alt="cap" width="24" height="24">
                        Personal pickup available within 15 minutes</li>

                        <li class="product-gray-text">
                        <img class="cap-gray" src="https://www.svgrepo.com/show/508373/baseball-cap.svg" alt="cap" width="24" height="24">
                        30 days to return</li>
                      </ul>
                    </div>

                    <div class="product-delivery-payment-icons">
                      <div class="product-delivery-payment-icon"><img src="" alt="DPD"></div>
                      <div class="product-delivery-payment-icon"><img src="" alt="InPost"></div>
                      <div class="product-delivery-payment-icon"><img src="" alt="Blik"></div>
                      <div class="product-delivery-payment-icon"><img src="" alt="Mastercard"></div>
                      <div class="product-delivery-payment-icon"><img src="" alt="Visa"></div>
                      <div class="product-delivery-payment-icon"><img src="" alt="Przelewy24"></div>
                    </div>

                  {/block}

                  <div class="product-social">
                    <span class="product-gray-text">Share:</span>
                    <a href="https://www.facebook.com">
                      <img src="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/facebook.svg"
                      class="product-icon-invert" width="30" height="30" alt="Facebook">
                    </a>

                    <a href="https://www.linkedin.com">
                      <img src="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/linkedin.svg" 
                      class="product-icon-invert" width="30" height="30" alt="LinkedIn">
                    </a>
                  </div>
                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}

            </div>

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
        </div>
      </div>

      {if $product.features}
      <div class="product-features-wrapper">
        <h3>Product attributes</h3>
        <table class="product-parameters">
          <thead>
            <tr>
              <th class="product-feature-name">Attributes</th>
              <th class="product-feature-value">Value</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$product.features item=feature}
              <tr>
                <td class="product-feature-name">{$feature.name}</td>
                <td class="product-feature-value">{$feature.value}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
      {/if}
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products row">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-12 col-sm-6 col-lg-4 col-xl-3"}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
