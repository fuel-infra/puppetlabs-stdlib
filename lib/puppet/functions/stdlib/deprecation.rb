# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# deprecation.rb
#
# ---- original file header ----
#
# @summary
#     Function to print deprecation warnings (this is the 3.X version of it), The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method.).
#
#
Puppet::Functions.create_function(:'stdlib::deprecation') do
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
    

    raise(Puppet::ParseError, "deprecation: Wrong number of arguments given (#{arguments.size} for 2)") unless arguments.size == 2

    key = arguments[0]
    message = arguments[1]

    if ENV['STDLIB_LOG_DEPRECATIONS'] == 'true'
      warning("deprecation. #{key}. #{message}")
    end
  
  end
end
