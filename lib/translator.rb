# require modules here

require "yaml"
require 'pry'

def load_library(path)
  # code goes here
  emo_file = YAML.load_file(path)

  emoticon_hash = {}

  # emoticon_hash["get_emoticon"] = Hash.new #=> {}
  # emoticon_hash["the_meaning"] = Hash.new #=> {}


  emo_file.each do |english_meaning, emoticon|
    emoticon_hash[english_meaning] = {}
    # emoticon_hash["get_emoticon"][emoticon.first] = emoticon.last
    # emoticon_hash["the_meaning"][emoticon.last] = english_meaning
    emoticon_hash[english_meaning][:japanese] = emoticon[1]
    emoticon_hash[english_meaning][:english] = emoticon[0]



  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)

emoticon_hash = load_library(path)

emoticon_result = emoticon_hash.find do |key, emoji|
  #  binding.pry
  return emoticon_hash[key][:japanese] if emoticon_hash[key][:english] == emoticon 

end


  emoticon_result ? emoticon_result : "Sorry, that emoticon was not found"

end


def get_english_meaning(path, emoticon)

  emoticon_hash = load_library(path)
  emoticon_result = emoticon_hash.keys.find do |key|

    emoticon_hash[key][:japanese] == emoticon
  end

  emoticon_result ? emoticon_result : "Sorry, that emoticon was not found"

end
