#An object that catches Ghost Methods and forwards them to another object, maybe wrapping some logic around the call, is called a Dynamic Proxy.
 
class Flickr
# Takes a Flickr API method name and set of parameters; # returns an XmlSimple object with the response
  def request(method, *params)
    response = XmlSimple.xml_in(http_get(request_url(method, params)), { 'ForceArray' => false })
    raise response['err']['msg'] if response['stat'] != 'ok'
    response
  end
 
  def method_missing(method_id, *params) 
    request(method_id.id2name.gsub(/_/, '.'), params[0])
  end
#...
 
#Refactoring with method_missing
 
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
 
  def method_missing(name, *args)
    super if !@data_source.respond_to?("get_#{name}_info") 
      info = @data_source.send("get_#{name}_info", args[0]) 
      price = @data_source.send("get_#{name}_price", args[0]) 
      result = "#{name.to_s.capitalize}: #{info} ($#{price})" 
      return "* #{result}" if price >= 100
      result
  end 
end
 
#Override respond_to? when overriding method_missing so that it doesn't lie
class Computer
  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super 
  end
#...
