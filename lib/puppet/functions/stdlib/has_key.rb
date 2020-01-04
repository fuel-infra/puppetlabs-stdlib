# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# has_key.rb
#
# ---- original file header ----
#
# @summary
#       Determine if a hash has a certain key value.
#
#    Example:
#
#        $my_hash = {'key_one' => 'value_one'}
#        if has_key($my_hash, 'key_two') {
#          notice('we will not reach here')
#        }
#        if has_key($my_hash, 'key_one') {
#          notice('this will be printed')
#        }
#
#
#
Puppet::Functions.create_function(:'stdlib::has_key') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    

    unless args.length == 2
      raise Puppet::ParseError, "has_key(): wrong number of arguments (#{args.length}; must be 2)"
    end
    unless args[0].is_a?(Hash)
      raise Puppet::ParseError, "has_key(): expects the first argument to be a hash, got #{args[0].inspect} which is of type #{args[0].class}"
    end
    args[0].key?(args[1])
  
  end
end
