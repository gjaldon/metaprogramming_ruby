#The & Operator
#Here’s a method that passes the block to another method:

def math(a, b) 
  yield(a, b)
end

def teach_math(a, b, &operation) 
  puts "Let's do the math:"
  puts math(a, b, &operation)
end

teach_math(2, 3) {|x, y| x * y}

=> Let's do the math: 
=> 6


#converting a block to Proc using &

def my_method(&the_proc) 
  the_proc
end

p = my_method {|name| "Hello, #{name}!" } 
puts p.class
puts p.call("Bill")

=> Proc
=> Hello, Bill!


#Again, you can use the & operator to convert the Proc to a block:

def my_method(greeting)
  puts "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" } 
my_method("Hello", &my_proc)
⇒ Hello, Bill!
