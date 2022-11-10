// // const String readOrders = r'''
// //   query ReadOrders($nOrders: Int!) {
// //     viewer {
// //       orders(last: $nOrders) {
// //         nodes {
// //           __typename
// //           id
// //           name
// //           viewerHasScanned
// //         }
// //       }
// //     }
// //   }
// // ''';

// const String readOrders = r'''
//     query ReadOrders {
//       sales_order {
//         state
//         status
//         customer_id
//         quote_id
//         store_id
//         order_currency_code
//         total_item_count
//         created_at
//         customer_firstname
//         customer_middlename
//         customer_lastname
//         shipping_address_id
//         billing_address_id
//         customer_email
//         entity_id
//         grand_total
//         total_qty_ordered
//         tax_amount
//         customer {
//           firstName
//           middleName
//           lastName
//           phoneID
//           email
//         }
//         products {
//           item_id
//           name
//           order_id
//           price
//           product_id
//           product_type
//           price_incl_tax
//           qty_ordered
//           quote_item_id
//           price
//           price_incl_tax
//         }
//       }
//     }
// ''';

// const String readCustomers = r'''
//     query ReadCustomers {
//       customer {
//         username
//         middleName
//         lastName
//         firstName
//         email
//         dateOfBirth
//         gender
//         phoneID
//       }
//     }
// ''';

// const String productsForOder = r'''
//     query ProductsForOrder($orderId: bigint!) {
//       sales_order_item(where: {order_id: {_eq: $orderId}}) {
//         item_id
//         name
//         order_id
//         price
//         ext_order_item_id
//         product_id
//         product_options
//         product_type
//         price_incl_tax
//         qty_ordered
//         parent_item_id
//         qty_shipped
//       }
//     }
// ''';

// const String testSubscription = r'''
// 		subscription test {
// 	    changed(id: 2) {
//         id
//         name
//       }
// 		}
// ''';
