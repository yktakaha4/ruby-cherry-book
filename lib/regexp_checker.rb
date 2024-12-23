def regexp_checker
  print 'Text?: '
  text = gets.chomp

  begin
    print 'Pattern?: '
    pattern = gets.chomp
    regexp = Regexp.new(pattern)
  rescue RegexpError => e
    puts "Invalid pattern: #{e.message}"
    retry
  end

  matches = text.scan(regexp)
  if matches.size > 0
    puts "Matched: #{matches.join(', ')}"
  else
    puts "Nothing matched."
  end
end

if __FILE__ == $0
  begin
    regexp_checker
  rescue Interrupt
    puts
  end
end
