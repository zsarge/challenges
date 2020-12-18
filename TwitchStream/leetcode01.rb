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
