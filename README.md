# dragon!

* [Homepage](https://reddragon.herokuapp.com)
* [Email](mailto:jweissman1986 at gmail.com)

## Description

*Dragon* is a text-based multiplayer role-playing game written in Ruby. 

There are two ways to play Dragon:

 - running the command-line tool `dragon` to engage in a single-player adventure
 - using the Dragon webapp to engage in a multi-player contest

## Features

Explore a procedurally-generated world! Defeat the legendary beast. Compete with
your friends.

## Examples

This is how the binary `dragon` invokes the single-player engine:

    require 'dragon'
    Dragon.play!

`Dragon.play!` is just a wrapper around `Dragon::Game.new.boot!`

`Dragon::Game` is in turn a CLI harness around the Dragon engine 
which is used to power the single player mode. 

The equivalent in the webapp context is a `Dragon::GameSession` which is a 
websockets-enabled harness around the engine.

## Requirements

Ruby, Sinatra, a websocket-capable host (Heroku should work out of the box). 

## Copyright

Copyright (c) 2015 Joseph Weissman

See LICENSE.txt for details.
