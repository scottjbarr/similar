# Similar

Similar is a library of functions to assist in determining the similarity
if arbitrary sets of data.

At the moment only the calcululation of pearson scores is implemented.

## Installation

Add this line to your application's Gemfile:

    gem 'similar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install similar

## Examples

    a = [1, 2, 3]
    b = [1, 2, 3]
    Similar.pearson_score(a, b)
    => 1.0

    a = [1, 2, 3]
    b = [1, 2, 5.0]
    Similar.pearson_score(a, b)
    => 0.9607689228305226

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
