# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# validate_array.rb
#
# ---- original file header ----
#
# @summary
#       Validate that all passed values are array data structures. Abort catalog
#    compilation if any value fails this check.
#
#    The following values will pass:
#
#        $my_array = [ 'one', 'two' ]
#        validate_array($my_array)
#
#    The following values will fail, causing compilation to abort:
#
#        validate_array(true)
#        validate_array('some_string')
#        $undefined = undef
#        validate_array($undefined)
#
#
#
Puppet::Functions.create_function(:'stdlib::validate_array') do
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
    

    function_deprecation([:validate_array, 'This method is deprecated, please use the stdlib validate_legacy function,
      with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.'])

    if args.empty?
      raise Puppet::ParseError, "validate_array(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      unless arg.is_a?(Array)
        raise Puppet::ParseError, "#{arg.inspect} is not an Array.  It looks to be a #{arg.class}"
      end
    end
  
  end
end
