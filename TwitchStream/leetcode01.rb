# input = "(thing{})"

def original_is_valid(s)
  start_list = ["(", "{", "["]
  stop_list  = [")", "}", "]"]
  temp_list = start_list.map(&:clone)
  all = (temp_list << stop_list).flatten!
  map = {}
  s = s.split("")

  s.keep_if {|char| all.include?(char)}

  s.each { |char|
    map[char] = 0 unless map.key?(char) 

    if start_list.include?(char)
      if map[char].even?
        map[char] += 1
      else
        return false
      end
    end
    
    if stop_list.include?(char)
      start = start_list[stop_list.index(char)] 
      return false unless s.include?(start)
      # p map[start]
      if map[start].odd? # returns from the entire function
        map[start] -= 1
      else 
        return false
      end
    end
    puts map
  }
  
  return false if map.values.any? {|num| num != 0}
  return true
end

def second_is_valid(s)
  start_list = ["(", "{", "["]
  stop_list  = [")", "}", "]"]
  s = s.split("")
  # s.keep_if {|char| start_list.include?(char) or stop_list.include?(char) }
  opens  = s.select {|char| start_list.include?(char)}
  closes = s.select {|char|  stop_list.include?(char)}

  opens.each_index { |index|
    expected = stop_list[index] 
    puts ""
    puts "expected     : #{expected}" 
    puts "opens[index] : #{opens[index]}"
    puts "closes[index]: #{closes[index]}"
    puts closes[index] == expected
    return false unless closes[index] == expected
    # return false unless opens[index] == closes[index]
  }
  return true
end

def is_valid(s)
  start_list = ["(", "{", "["]
  stop_list  = [")", "}", "]"]
  s = s.split("")
  s.keep_if {|char| start_list.include?(char) or stop_list.include?(char) }

  queue = ""

  # check number
  return false unless s.size.even?
  opens  = s.select {|char| start_list.include?(char)}
  closes = s.select {|char|  stop_list.include?(char)}
  return false unless opens.size == closes.size

  # check order
  s.each do |char|
    if start_list.include?(char)
      queue << char
    end
    if stop_list.include?(char)
      expected = start_list[stop_list.index(char)] 
      if queue[-1] == expected 
        queue = queue.chop
      else
        return false
      end
    end
  end
  return true
end

def run(input)
  puts "#{is_valid(input)}\t- \"#{input}\""
end

run("(thing})")
run("(thing)")
run("({)}")
run("({{}")
run("({(){}})")
run("(lkasj{{{{dthing})")
run("{[}]")
run("({})")
run("([{[[][()}]]}])")
