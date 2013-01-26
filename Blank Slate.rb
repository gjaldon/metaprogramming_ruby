#BlankSlate Spell example
#Reserved methods - with a double leading underscore __ to signify methods that might break Ruby if removed or redefined
 
class BlankSlate
  # Hide the method named +name+ in the BlankSlate class. Don't # hide +instance_eval+ or any method beginning with "__".
  def self.hide(name)
    if instance_methods.include?(name.to_sym) and
    name !~ /^(__|instance_eval)/
      @hidden_methods ||= {}
      @hidden_methods[name.to_sym] = instance_method(name) undef_method name
    end 
  end
 
instance_methods.each { |m| hide(m) }
 
#...
 
 
#Remove all other methods in Computer class unless they are method_missing | respond_to | __(reserved_methods)
class Computer 
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?/ 
  end
# ...
