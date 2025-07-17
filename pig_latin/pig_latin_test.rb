#!/usr/bin/env ruby


def pig_latin(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  i=0
  word.each_char do |ch|
    if vowels.include?(ch)
      break
    end
    i+=1
  end 
  i == 0 ? "#{word}ay" : "#{word[i..-1]}" + "#{word[0...i]}ay" 
end

words = ['pig', 'latin', 'elevator', 'glove', 'where' ]

words.each do |word|
  puts word + ' ' + pig_latin(word)
end
