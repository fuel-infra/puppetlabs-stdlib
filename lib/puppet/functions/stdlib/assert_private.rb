# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# assert_private.rb
#
# ---- original file header ----
#
# @summary
#       Sets the current class or definition as private.
#    Calling the class or definition from outside the current module will fail.
#
#
Puppet::Functions.create_function(:'stdlib::assert_private') do
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
    

    raise(Puppet::ParseError, "assert_private(): Wrong number of arguments given (#{args.size}}) for 0 or 1)") if args.size > 1

    scope = self
    if scope.lookupvar('module_name') != scope.lookupvar('caller_module_name')
      message = nil
      if args[0] && args[0].is_a?(String)
        message = args[0]
      else
        manifest_name = scope.source.name
        manifest_type = scope.source.type
        message = (manifest_type.to_s == 'hostclass') ? 'Class' : 'Definition'
        message += " #{manifest_name} is private"
      end
      raise(Puppet::ParseError, message)
    end
  
  end
end
