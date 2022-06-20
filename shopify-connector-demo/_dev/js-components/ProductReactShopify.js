import React, {useState, useEffect} from 'react';

const ProductReactShopify = (props) => {
  const { title, product } = props;

  const baseUrl = `https://magboats.myshopify.com/api/2019-07/graphql`
  const myQuery = `
  {
    productByHandle(handle: "topo-designs-rover-pack-classic") {
      id,
      handle,
      title,
      description,
      descriptionHtml,
      updatedAt,
      images(first: 1){
        edges{
            node{
                id
                originalSrc
                altText
            }
        }
      },
      priceRange {
        minVariantPrice {
          amount,
          currencyCode
        }
      }
    }
  }
`

  let [productInfo, setProductInfo] = useState(null)

  useEffect(() => {
    
    fetch(baseUrl,{
      method: 'POST',

      headers: {
        "X-Shopify-Storefront-Access-Token": "bdc1e56d3a85aa6606cb303ccfd94343",
        "Content-Type": "application/json",
        "Accept":"application/json"
      },

      body: JSON.stringify({
        query: myQuery
      })

  }
  )
    .then(response => response.json())

    .then(res => {

      console.log("got" + res.data.productByHandle.id)
      // debugger;
      const url = res.data.productByHandle.images.edges[0].node.originalSrc
      const priceObj = res.data.productByHandle.priceRange.minVariantPrice;
      const price = `${priceObj.currencyCode} ${priceObj.amount}`
      const infoObj = {
        price: price,
        url:url,
        title: res.data.productByHandle.title
      }
      setProductInfo(infoObj)
    })

  },[])
   


  return (
    <div className="Product">
      {/* <h1>PRODUCT - {title}</h1> */}
      <div className="container">
        

        <h3>CHECK IT OUT:<br/> {productInfo && productInfo.title}</h3>
        <div>{productInfo && <img style={{maxWidth:"200px"}} src={productInfo.url}></img>}</div>
        <div>{productInfo && <span>{productInfo.price}</span>}</div>
        <div style={{fontSize:"8pt"}}>PROD CODE:{product}</div>
      </div>
    </div>
  );
};

export default ProductReactShopify;
