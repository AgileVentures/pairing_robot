require 'byebug'

def run_code
  triple(3,4,5)
end

def fix_code(e)
  # byebug
  if e.class == NoMethodError
    /undefined method \`(.*)\' for main\:Object/ =~ e.message
    eval "def #{$1}; 'robot method' ; end "
    # would be cool to have the robot return a description of what it did to solve the error and why ...
  elsif e.class == ArgumentError
    /wrong number of arguments \(given (.*), expected \d\)/ =~ e.message
    num_args = $1.to_i # could use class or arg to auto-infer an approprate name?
    arg_string = (0..num_args-1).map {|i| "arg#{i}"}.join(',') 
    /\(eval\)\:1\:in \`(.*)\'/ =~ e.backtrace.first
    method_name = $1
    eval "def #{method_name}(#{arg_string}); 'robot method' ; end"  
  else
    puts "cannot handle error class #{e.class}; #{e.message}"
  end

end

# (1..5).each do
#   begin 
#     run_code
#   rescue => e
#     fix_code(e)
#   end
# end

# this whole thing could be RSpec'd and then I'd like to be able to use RSpec to generate method bodies

# is there some way to dump the source code of the method we created? or get the method signature ...?
# better overall if we put methods in a class?  

# puts run_code


