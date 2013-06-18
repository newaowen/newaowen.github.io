# encoding: utf-8
require 'cgi'

module Jekyll
  module TruncateFilter
    # Truncate a string down to x characters
    def utruncate(input, length = 50, truncate_string = "...")
      if input.nil? then return end
      l = length.to_i - truncate_string.length
      l = 0 if l < 0
      a=0
      input.length > length.to_i ? input.chars.take_while{|c| (a += c.bytes.to_a.length) <= length }.join + truncate_string : input
    end

  end
end

Liquid::Template.register_filter(Jekyll::TruncateFilter)