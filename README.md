# get_mad cli

**A modified version of [get_cli](https://pub.dev/packages/get_cli) with a different structure and
code organization.**

## Why mad

* Of-course if you are using an unofficial version of [get_cli](https://pub.dev/packages/get_cli)
  from unknown developer would indicates you are mad.
* So, here package is not mad, the person who is willing to take risk is mad and this package is
  just for them.

## Features

* Uses [get_mad](https://pub.dev/packages/get_mad) package instead
  of [get](https://pub.dev/packages/get).
* Controllers:
    * Removed counter example.
    * Removed onReady.
* Bindings:
    * Added tag implementation for creating and checking existing instance.
    * Uses `Get.put` instead of `lazyPut`.
* Initial extension for GetX navigation `Get.toNamedUnique` to navigate any route many times.

## Documentation

* To use this cli use commands 'mad' or 'madx'
* For more information, see the original [get_cli](https://pub.dev/packages/get_cli) documentation.

## Examples

* `mad init`
* `madx create page product_detail`
