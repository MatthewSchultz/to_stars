# ToStars

A simple library for adding star-ratings to numeric types in ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add to_stars

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install to_stars

## Usage

By default, adds the to_stars method to Numeric.

```
3.to_stars #=> "★★★"
```

Can generate a "out of" rating:

```
3.to_stars(5) #=> "★★★/5"
```

### Options

#### out_of (default: nil)

A number to set the "out of" representation. Set to nil to disable.

```
3.to_stars #=> "★★★"
3.to_stars(out_of: 5) #=> "★★★/3"
3.to_stars(out_of: nil) #=> "★★★"
```

#### seperator (default: '/')

Defines the string to use to seperate the rating and the "out of" representation:

```
3.to_stars(out_of: 5, seperator: ' out of ') #=> "★★★ out of 5"
```

#### character (default: '★')

Defines the character to be used for a star:

```
3.to_stars(character: 'X') #=> "XXX"
3.to_stars(character: '&#9733;') #=> "&#9733;&#9733;&#9733;"
```

#### out_of_format (default: :numeric)

Defines the format to use to display the "out of" representation. There are 3 options:

##### :character

Show the "out of" representation as symbols, like the character:

```
3.to_stars(out_of: 5, out_of_format: :numeric) #=> "★★★/★★★★★"
```

##### :one_and_numeric

Show the "out of" representation as a numeric representation with a symbol:

```
3.to_stars(out_of: 5, out_of_format: :numeric) #=> "★★★/5★"
```

##### :numeric (default)

Show the "out of" representation as a number:

```
3.to_stars(out_of: 5, out_of_format: :numeric) #=> "★★★/5"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests and cop. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in [`version.rb`][lib/to_stars/version.rb], and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ToStars project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
