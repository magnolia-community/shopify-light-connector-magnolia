<div class="product">
[#if content.title?has_content]
  <h3>${content.title!}</h3>
[/#if]

[#if content.product?has_content]

  [#assign boatObj = restfn.call("shopify", "product", {"id": content.product})]
  [#assign boat = restfn.asMap(boatObj)]
  [#assign item = boat.data.productByHandle]

  [#assign title = item.title]
  [#assign amount = item.priceRange.minVariantPrice.amount]
  [#assign currency = item.priceRange.minVariantPrice.currencyCode]
  [#assign imgSrc = item.images.edges[0].node.originalSrc]
  [#assign description = item.descriptionHtml]

  <section class="hero is-medium is-primary is-bold">
      <div class="hero-body">
          <div class="container">
              <p class="subtitle" style="font-size:14px">
                  <strong>${title}</strong>
              </p>
              <p class="subtitle">
                  <strong>Price:</strong> ${amount} ${currency}
              </p>
          </div>
      </div>
  </section>
  
  <section class="section">
      <div class="container">
          <img src="${imgSrc}" alt="" style="max-width:200px; max-height:200px">
           [#-- <p>
              ${description}
          </p>  --]
      </div>
  </section>  

[/#if]
</div>
