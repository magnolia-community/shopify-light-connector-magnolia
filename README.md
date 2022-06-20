# Shopify Light Connector

This project demonstrates how to connect to a 3rd party system (Shopify) from Magnolia using configuration only, no code. It makes use of the [REST Client](https://docs.magnolia-cms.com/product-docs/6.2/Modules/List-of-modules/REST-Client-module.html) feature.

The `shopify-connector` directory is a light module that you can use in your project.

The `shopify-connector-demo` directory is a light module demonstrating how to use it. 


Note: Several features require Magnolia DXCore.

Tested on Magnolia 6.2.19 (Expected to work on all 6.2 versions)

![Usage in pages aapp](/shopify-connector-demo/_dev/README-shopify-connector-1.png "Pages app")

Want to quickly try it out? 
- On a DXCore Instance, (For example use `mgnl jumpstart` and choose `magnolia-dx-core-webapp`)
- Just drop both directories in your `light-modules` directory.
- Log out and log in again to get the new apps.
- Open the `Shopify Products` app to browse the remote products.
- Open the `Tours2` app, and import the `_dev/content-to-import/tours.magnolia-travels.yaml` file.
- Edit the `Surfin-Safari` tour, add or remove a product if you like.
- Open the `Pages` app and create a new `Shopify Home` page.
- Add the available components to it.
- Enter "Deuter" in the `Find Bar`.


## Features (shopify-connector)

- A Shopify REST Client is configured, with calls for `Product`, `Products` and `Periscope` (for findbar search results.)
- A `Shopify Products` app which allows browsing and some preview of content in Shopify.
- You can search in the `Find Bar` for products in the Shopify system.

## Demo Features (shopify-connector-demo)
- A `Tours2` app which shows the standard Magnolia tours sample content, but adds a Multi Combobox to link Shopify products to a tour.

### Freemarker demo 
- A `product` (freemarker) template component to display 1 product.
- A `tourProduct` (freemarker) template component to display a tour and a list of all the products linked to it.
- A `Shopify Home` (freemarker) page template to make it easy to try the freemarker components.
- Decorations to allow using the components on an `mtk2` page.

### SPA demo
- A `productReactShopify` (spa) template component to display a product in a REACT SPA.
- A `ProductReactShopify.js` React component to do the actual rendering of the component. (In `_dev/js-components/ProductReactShopify.js`)
- Decorations to allow using the SPA component on an `website-spa-demo` page. (A separate demo project)

The SPA features work in the [website-spa-demo](https://git.magnolia-cms.com/projects/DEMOS/repos/website-spa-demo/browse) demo project. 

To use it you need to put the `ProductReactShopify.js` file in the `/spa/react-website/src/components` directory and make the standard adjustments in the `/spa/react-website/src/magnolia.config.js` file.


## Notes

The restClient uses the Magnolia demo Shopify account. Change the API keys to point to your Shopify account.

NOTE: the tourProduct template is hardcoded to use the tour with the path `/magnolia-travels/Surfin--Safari`. 

In the `tours` or `tours2` app you can also `import` the content in `/_dev/content-to-import` - but be aware that images for the tours won't be imported.

## Extras

In `_dev/shopify-demo` are some addition decorations to make the components available in the travel demo. To use them you can just move them into the root `decorations` directory in the light module.

