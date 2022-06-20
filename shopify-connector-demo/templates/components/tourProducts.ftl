<div class="tourProducts">
  <h2> Tour Products </h2>

  <p>NOTE: This template is hard coded to list the products 
  on the `Surfin--Safari` tour.
  </p>
[#assign tour = cmsfn.contentByPath('/magnolia-travels/Surfin--Safari', 'tours')]

<h3>${tour.name}</h3>

[#if tour.product?has_content]

[#list tour.product as product]
    
      [#assign boatObj = restfn.call("shopify", "product", {"id": product})]
      [#assign boat = restfn.asMap(boatObj)]
      [#assign item = boat.data.productByHandle]

      [#assign title = item.title]
      [#assign imgSrc = item.images.edges[0].node.originalSrc]
  
      <h4>${title}</h4>
      <img src="${imgSrc}" alt="" style="max-width:100px; max-height:100px">
      [#sep]<hr class="has-margin-top">[/#sep]
    
[/#list]

[/#if]
</div>
