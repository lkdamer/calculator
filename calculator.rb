include Math

#Which mathy method should we call?
def calculate(f, a, b)
  if ["addition", "+"].include?(f)
    add(a, b)
  elsif ["subtraction", "-"].include?(f)
    subtract(a, b)
  elsif ["multiplication", "*"].include?(f)
    multiply(a, b)
  elsif ["division", "÷", "/"].include?(f)
    divide(a, b)
  elsif ["exponent", "^"].include?(f)
    exponent(a, b)
  elsif ["square root", "√"].include?(f)
    sqr_root(a)
  end
end


#Mathy methods
def add(a, b)
  a + b
end

def subtract(a, b)
 a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  a.to_f / b.to_f
end

def exponent(a, b)
  a**b
end

def sqr_root(a)
  sqrt(a)
end


#Guiding methods (guides the user through the calculator)
def start()
  # Kicks things off, gets input(type of math to be done)
  puts "Hello there!"
  puts "What kind of math would you like to do?"
  input = gets.chomp #.to_sym
  input_types = ["addition", "subtraction", "multiplication", "division", "exponent", "square root", "+", "-", "*", "/", "÷", "^", "√"]

  if !input_types.include?(input)
    puts "I don't know that math."
    start
#   return
  else
    return input
  end
end


def take_i_get_nums(input)
  #Takes input (type of math to do) and gets the correct number of numbers
  numstatus = false
  num_1_status = false
  num_2_status = false
  while (num_1_status == false && num_2_status == false) || numstatus == false
    if input == "square root"
      puts "What number?"
      numraw = gets.chomp
      num = numraw.to_f
      if num == 0 && numraw != "0"
        puts "Please type a number, not a word."
      else
        numstatus = true
        return num
      end
    else
      puts "What is the first number?"
      num1raw = gets.chomp
      num_1 = num1raw.to_f
      while num_1 == 0 && num1raw != "0"
        puts "Please type a number, not a word."
        num1raw = gets.chomp
        num_1 = num1raw.to_f
      end
      num_1_status = true
      puts "What is the second number?"
      num2raw = gets.chomp
      num_2 = num2raw.to_f
      while num_2 == 0 && num2raw != "0"
        puts "Please type a number, not a word."
        num2raw = gets.chomp
        num_2 = num2raw.to_f
      end
      num_2_status = true
      return num_1, num_2
    end
  end
end

#Here is where the script starts
input = start
num_1, num_2 = take_i_get_nums(input)
answer = calculate(input, num_1, num_2)

#Figure out what math sign you need to return the answer
math_sign_h = {"addition" => '+', "subtraction" => '-', "multiplication" => '*', "division" => '÷', "exponent" => '^', "square root" => '√'}
if math_sign_h.has_key?(input)
  math_sign = math_sign_h[input]
else
  math_sign = input
end

#Do they want a float or an integer?
ans_type_l = ["float", "integer"]
ans_type = "blah"
while !ans_type_l.include?(ans_type)
  puts "Do you want a float or an integer answer?"
  ans_type = gets.chomp
end
if ans_type == "float"
  answer = answer.to_f
else
  answer = answer.to_i
end

#Return the answer in the proper format
if input == "square root"
  puts "#{math_sign}#{num_1}=#{answer}"
else
  puts "#{num_1}#{math_sign}#{num_2}=#{answer}"
end
