module Rainbowable
  def rainbow
    to_s.each_char.map.with_index do |char, index|
      color = index % 6 + 31
      "\e[#{color}m#{char}"
    end.join + "\e[0m"
  end
end
