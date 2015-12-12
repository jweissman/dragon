# dragon!

[![Code Climate](https://codeclimate.com/github/jweissman/dragon/badges/gpa.svg)](https://codeclimate.com/github/jweissman/dragon)

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

## Architecture

In Dragon, a player is presented with a description of the world,
and a list of potential user actions, which are commands for the system.  
The Dragon engine handles these `Command`s and generates a list of
`Event`s that result from them. Some of these events may indicate new
actions that are now possible; some commands come from ambient context -- there
is the notion of a current `Scene` that provides commands, and drives things 
like the headline text. (For scenes like `Conversation`, there is also the 
notion of a "topic" which can provide additional actions, etc.)

## Requirements

Ruby, Sinatra, a websocket-capable host (Heroku should work out of the box). 

## Copyright

Copyright (c) 2015 Joseph Weissman

See LICENSE.txt for details.
