# MarsRover

This gem aims to implement some rudimentary but extensible structures related to the following Google code challenge:

https://code.google.com/archive/p/marsrovertechchallenge/

MARS ROVERS

A squad of robotic rovers are to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by the rovers so that their on board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position is represented by a combination of an x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.

'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

## Assumptions

I've made the assumption that the Rovers all get "spawned into the map" all at once, and that they cannot collide with other Rovers. I've decided that when they try to move to a spot where they'll either:
* fall off the plateau, or
* bump into another Rover
They'll instead just _not move_.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mars_rover'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mars_rover

Alternatively, if none of the above works, just:
* Clone the repo
* Open a terminal in the root of where you cloned it
* Make sure Ruby 2.7.0 is installed and active in your terminal
* Run `bundle install`

At this point, `bin/console` should work, as well as `rspec` should be all green.

## Usage

* TL;DR:

```ruby
client = MarsRover::Client.new

client.retrieve_formatted_output
```

## Testing

Just run `rspec` within the root of the gem. If you'd like to test additional input strings, you can isolate the rspec command to the client with:
`rspec spec/client_spec.rb`
after adding some extra tests to above-mentioned spec.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SparkusK/mars_rover.
