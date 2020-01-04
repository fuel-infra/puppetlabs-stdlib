# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
require 'shellwords'
#
# shell_escape.rb
#
# ---- original file header ----
#
# @summary
#       Escapes a string so that it can be safely used in a Bourne shell command line.
#
#    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
#    quotes.
#
#    This function behaves the same as ruby's Shellwords.shellescape() function.
#
#
Puppet::Functions.create_function(:'stdlib::shell_escape') do
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
    

    raise(Puppet::ParseError, "shell_escape(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    # explicit conversion to string is required for ruby 1.9
    string = arguments[0].to_s

    result = Shellwords.shellescape(string)

    return result
  
  end
end
