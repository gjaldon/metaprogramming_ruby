#Spell: Deferred Evaluation
#A Proc is a block that has been turned into an object. You can create a Proc by passing the block to Proc.new. 
#Later, you can evaluate the block-turned-object with Proc#call( ):

inc = Proc.new {|x| x + 1 }
# more code...
inc.call(2) # => 3


#Ruby also provides two Kernel Methods (51) that convert a block to a Proc: lambda() and proc().

dec = lambda {|x| x - 1 } 
dec.class # => Proc 
dec.call(2) # => 1


