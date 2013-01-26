#Metaprogrammming Ruby
#Dynamic Dispatch examples
 
#From Camping web framework
# Load configuration if any
if conf.rc and File.exists?( conf.rc ) 
  YAML.load_file(conf.rc).each do |k,v|
    conf.send("#{k}=", v)
  end 
end
 
#From Test::Unit
# Aka 'Pattern Dispatch'
method_names = public_instance_methods(true)
tests = method_names.delete_if {|method_name| method_name !~ /^test./}
 
 
#Refactored Class using Dynamic Dispatch and Dynamic Method Generation
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end
 
  def self.define_component(name) 
    define_method(name) {
      info = @data_source.send "get_#{name}_info", @id 
      price = @data_source.send "get_#{name}_price", @id 
      result = "#{name.capitalize}: #{info} ($#{price})" 
      return "* #{result}" if price >= 100
      result 
    }
  end 
end
