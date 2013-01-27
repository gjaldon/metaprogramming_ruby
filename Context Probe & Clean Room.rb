#Spell: Context Probe

class MyClass 
  def initialize
    @v = 1
  end 
end

obj = MyClass.new 
obj.instance_eval do
  self # => #<MyClass:0x3340dc @v=1>
  @v # => 1
end

#Ruby 1.9 introduced a method named instance_exec(). This is similar to instance_eval(), but it also allows you to pass argu- ments to the block:
class C
  def initialize
    @x, @y = 1, 2
  end 
end
C.new.instance_exec(3) {|arg| (@x + @y) * arg }  # => 9

#Spell: Clean Room
#Sometimes you create an object just to evaluate blocks inside it. An object like that can be called a Clean Room:
class CleanRoom
  def complex_calculation
    # ...
  end
  
  def do_something # ...
  end 
end

clean_room = CleanRoom.new 
clean_room.instance_eval do
  if complex_calculation > 10 
    do_something
  end 
end

