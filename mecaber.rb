#!/usr/bin/ruby -Ku
require 'MeCab'

class MeCabed
	attr_accessor :word
	def initialize(parsed)
		@word = []
		parsed.split("\n").each do |w|
			@word << MeCabInfo.new(w)
		end
	end
end

class MeCabInfo
	attr_accessor :surf, :pos, :posd1, :posd2, :posd3, :ktype, :kform, :root, :read, :pron
	def initialize(w)
		@surf, @pos, @posd1, @posd2, @posd3, @ktype, @kform, @root, @read, @pron = w.split(/[\t,]/)
	end
end

def mecaber(str)
	tagger = MeCab::Tagger.new()
	return  MeCabed.new(tagger.parse(str))
end
