# This script makes a README.md with links to all my solutions.
# Run it with 'ruby makeReadme.rb'.
# This was written using Ruby 2.5.1
# by Zack Sargent

HEADER = "\
# [Project Euler](https://projecteuler.net)

These are my solutions for various [Project Euler](https://projecteuler.net) problems.

I use Project Euler mainly for programming challenges, but it also is nice to practice mathematical thinking.

Every solution gets its own directory, because I plan on varying the languages I use, and this keeps everything uniform.

To Do:

 - create script to modify this readme with links to the solutions
 - Make `addSolution.rb` align all numbers to the thousands place for easy name sorting
"

files = Dir.entries("solutions")
files = files.drop(2) # drop '.' and '..'

arr = (1..100).to_a
arr = arr.map(&:to_s)

def makeColumnElement(number, width)
  width += 2 # add more spacing
  string = number
  string.prepend("| ")
  return "" if number.nil? || width - number.size <= -1
  string << (" " * (width - number.size))
  return string
end

def makeRow(array, widths)
  row = ""
  col = 0
  array.each { |ele|
    row << makeColumnElement(ele, widths[col] + 1)
    col += 1
  }
  row << "|\n"
  return row
end

def makeHeader(widths)
  row = ""
  widths.each { |width|
    row << makeColumnElement("-"*(width), width + 1)
  }
  row << "|\n"
  return row
end

def getWidths(array, cols)
  widths = []
  1.upto(cols) do |i|
    column = []
    (i..array.size).step(cols) do |j|
      column.append(array[j-1])
    end
    widths.append(column.max_by(&:length).size)
  end
  return widths
end
  
# makeTable takes an array of strings to be formatted as a 
# markdown table. The number of elements in the array needs to
# be evenly divisble by the number of columns.
def makeTable(array, cols)
  return nil unless array.size%cols == 0
  table = []
  # width = array.max_by(&:length).size
  widths = getWidths(array, cols)
  
  # loop through array by row
  (1..array.size).step(cols) do |i|
    # section = row, accounting for index changes
    section = array[i-1..i+cols-2] 
    table.append(makeRow(section, widths))
  end

  table.insert(1, makeHeader(widths))
  return table.join
end

arr[25] = "This is a long test string"
10.times do arr.prepend(" ") end

TABLE = makeTable(arr, 10)
puts TABLE

content = "\
#{HEADER}

#{TABLE}
"

File.write("README.md", content, mode: "w")

