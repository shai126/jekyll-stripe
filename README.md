# jekyll-stripe

A Jekyll plugin for easily letting site visitors buy products you've set up in your Stripe dashboard.

## Installation

Add the following to your site's `Gemfile`:

```
gem 'jekyll-stripe'
```

Add the following to your site's `_config.yml`:

```
plugins:
  - jekyll-stripe
```

If you are using a Jekyll version less than `3.5.0`, use the `gems` key instead of `plugins`.

## Usage

Add the following right before `</head>` in your site's layout:

```
{% stripe pk_live_1234567890 %}
```

Where `pk_live_1234567890` is your Stripe **Publishable** API Key. **_Never put your secret key here!_**

And then wherever you want to show a buy button, add:

```
{% stripe_button price_1234567890 %}
```

Where `price_1234567890` is the `API ID` for the `Price` you want this button to be used to purchase. You can create `Prices` within `Products` in your Stripe dashboard.

If the customer cancels during checkout they'll be redirected to the page where they clicked the button.

If checkout succeeds, the customer will be redirected to the same page with `-thanks` appended, e.g. `https://example.com/my-course-thanks/` if the button was on `https://example.com/my-course/`.

Use Stripe webhooks (or Zapier, etc) if you need something to happen behind the scenes after a confirmed purchase.

## Known limitations

- Ability to customize:
    - Button text
    - Button styling (though you can do this easily with CSS)
    - Success/cancel URLs
    - Other settings
- Protection against incorrect setup
- Protection against accidentally using secret key

## Stripe docs

https://stripe.com/docs/payments/checkout/client

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/shai126/jekyll-stripe](https://github.com/shai126/jekyll-stripe).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
