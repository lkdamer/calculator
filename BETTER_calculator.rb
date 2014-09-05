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

#User-guiding methods
def initial_input()
  puts "What kind of math would you like to do?"
  math_type = gets.chomp
  math_types = ["addition", "subtraction", "multiplication", "division", "exponent", "square root", "+", "-", "*", "/", "÷", "^", "√"]

  if !math_types.include?(math_type)
    puts "I don't know that math."
    initial_input
  else
    return math_type
  end
end

def get_nums(operation, legacy_num)
  #Takes input (type of math to do) and gets the correct number of numbers
  num = legacy_num
  num_1 = legacy_num
  num_2 = nil
  if num && operation == "square root"
    return num, nil
  end
  while ! (num_1 || num)
    if operation == "square root"
      puts "What number would you like to square root?"
      numraw = gets.chomp
      num = numraw.to_f
      if num == 0 && numraw != "0"
        puts "Please type a number, not a word."
      else
        return num, nil
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
    end
  end
  puts "What other number should we use?"
  num2raw = gets.chomp
  num_2 = num2raw.to_f
  while num_2 == 0 && num2raw != "0"
    puts "Please type a number, not a word."
    num2raw = gets.chomp
    num_2 = num2raw.to_f
  end
  return num_1, num_2
end

#THIS IS WHERE THE SCRIPT STARTS RUNNING
final_go = false
legacy_num = nil
while final_go == false
  operation = initial_input
  num1, num2 = get_nums(operation, legacy_num)
  answer = calculate(operation, num1, num2)

  #Figure out what math sign you need to return the answer
  math_sign_h = {"addition" => '+', "subtraction" => '-', "multiplication" => '*', "division" => '÷', "exponent" => '^', "square root" => '√'}
  if math_sign_h.has_key?(operation)
    math_sign = math_sign_h[operation]
  else
    math_sign = operation
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
  if operation == "square root"
    puts "#{math_sign}#{num1}=#{answer}"
  else
    puts "#{num1}#{math_sign}#{num2}=#{answer}"
  end

  #See if they want to go again.
  puts "Would you like to do anything else with #{answer}?"
  again = gets.chomp
  if again == "yes"
    puts "Great!"
    legacy_num = answer
  else
    puts "Okay, thanks, bye!"
    final_go = true
  end
end
