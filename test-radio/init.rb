#!/usr/bin/env ruby

require_relative 'classes/radio'

radio = Radio.new
puts "Default radio: " + radio.status

fm_radio = Radio.fm({volume: 8})
puts "FM radio: " + fm_radio.status

am_radio = Radio.am({frequency: 880.0})
puts "AM radio: " + am_radio.status

radio.volume = 3
radio.frequency = 99.9
puts "Soft rock: " + radio.status

radio.band = 'AM'
puts "Switch to AM: " + radio.status

radio.frequency = 1330.0
puts "News radio: " + radio.status

radio.band = 'FM'
puts "Switch to FM: " + radio.status

radio.frequency=650.0
puts "Does not switch to invalid 650 freq as set to FM" + radio.status
