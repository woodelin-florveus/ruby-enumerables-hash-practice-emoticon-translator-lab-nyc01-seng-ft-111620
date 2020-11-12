# require modules here

require "yaml"
require 'pry'

def load_library(path)
  # code goes here
  emo_file = YAML.load_file(path)

  emoticon_hash = {}

  emoticon_hash["get_emoticon"] = Hash.new #=> {}
  emoticon_hash["the_meaning"] = Hash.new #=> {}


  emo_file.each do |english_meaning, emoticon|
    # binding.pry
    emoticon_hash["get_emoticon"][emoticon.first] = emoticon.last
    emoticon_hash["the_meaning"][emoticon.last] = english_meaning
    emoticon_hash[english_meaning] = {}

  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)

  emoticon_hash = load_library(path)
  emoticon_result = emoticon_hash["get_emoticon"][emoticon]
  emoticon_result ? emoticon_result : "Sorry, that emoticon was not found"

end


def get_english_meaning(path, emoticon)

  emoticon_hash = load_library(path)
  emoticon_result = emoticon_hash["the_meaning"][emoticon]
  emoticon_result ? emoticon_result : "Sorry, that emoticon was not found"

end
