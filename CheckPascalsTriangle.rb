# Challenge name: Check Pascal's Triangle
# Challenge link: https://www.reddit.com/r/dailyprogrammer/comments/psf4n/2162012_challenge_8_difficult/
# Completed by Zack Sargent on: {date}
# Notes: Write a program that will take coordinates,
#        and tell you the corresponding number in pascals triangle.
# Resources: https://www.mathsisfun.com/pascals-triangle.html

class PascalsTriangle
  def self.get_line(x)
    # Rows of Pascals Triangle are equal to 11
    # to the power of the row number, starting at row 0
    (11 ** (x)).to_s.chars
  end
  def self.go_to(x, y)
    return nil if x < 0
    # the challenge expects positions to start at 1
    get_line(x - 1)[y - 1]
  end
  def self.print_line(line)
    puts line.map { |i|
      i + " "
    }.join()
  end
  def self.print(lines)
    return nil if lines <= 1
    0.upto(lines - 1) { |x|
      print_line(get_line(x))
    }
  end
end

puts "Input (1,1):"
puts PascalsTriangle.go_to(1, 1)

puts "\nInput (4,2):"
puts PascalsTriangle.go_to(4, 2)

puts "\nInput (1,19):"
puts PascalsTriangle.go_to(1, 19)

puts "\nExtra credit: "
PascalsTriangle.print(15)
