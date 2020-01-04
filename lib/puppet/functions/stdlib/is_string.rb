# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# is_string.rb
#
# ---- original file header ----
#
# @summary
#       Returns true if the variable passed to this function is a string.
#
#
Puppet::Functions.create_function(:'stdlib::is_string') do
  # @param arguments
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :arguments
  end


  def default_impl(*arguments)
    

    function_deprecation([:is_string, 'This method is deprecated, please use the stdlib validate_legacy function,
                          with Stdlib::Compat::String. There is further documentation for validate_legacy function in the README.'])

    raise(Puppet::ParseError, "is_string(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    type = arguments[0]

    # when called through the v4 API shim, undef gets translated to nil
    result = type.is_a?(String) || type.nil?

    if result && (type == type.to_f.to_s || type == type.to_i.to_s)
      return false
    end

    return result
  
  end
end
