#Flat Scope - replace scope gate with methods so that one scope can access vars from another scope
my_var = "Success"
 
MyClass = Class.new do
  puts "#{my_var} in the class definition!"
 
  define_method :my_method do
    puts "#{my_var} in the method!"
  end 
end
 
MyClass.new.my_method
#⇒ Success in the class definition! Success in the method!
 
#Spell:Scope Gate - where a program leaves the previous scope and opens a new one
 
#Shared Scope
def define_methods
  shared = 0
  
  Kernel.send :define_method, :counter do 
    shared
  end
 
  Kernel.send :define_method, :inc do |x| 
    shared += x
  end 
end
 
define_methods
counter       # => 0
inc(4)
counter       # => 4
 
