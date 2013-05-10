# Howami

All unix people know the `whoami` command.

    $ whoami
    mroth

But what if you want to keep track of _how_ you are?

    $ howami
    Current weight: 138.8 pounds (12.97 % body fat)
    Activity level: 2765 steps thus far today
    Sleep last night: 5 hours, 41 min.


`howami` uses the Fitbit API to give you a quick CLI glance at your vital stats as synchronized from your nerdy quantified-self tracking devices.

## Installation

Just install it via rubygems:

    $ gem install howami

Done.

## Usage

Do `howami --auth` to complete login via the Fitbit API.  At any point after that, you can do `howami` to see your stats.

## What devices?

Since people keep asking, I personally use a [Fitbit Aria](http://www.fitbit.com/aria) scale to weigh myself, and a [Fitbit Flex](http://www.fitbit.com/flex) for activity/sleep tracking.

<sub>(And I've lost 22lbs. at time of writing this!)</sub>