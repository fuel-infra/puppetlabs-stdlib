# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# concat.rb
#
# ---- original file header ----
#
# @summary
#       Appends the contents of multiple arrays into array 1.
#
#    *Example:*
#
#        concat(['1','2','3'],['4','5','6'],['7','8','9'])
#
#    Would result in:
#
#      ['1','2','3','4','5','6','7','8','9']
#
#
Puppet::Functions.create_function(:'stdlib::concat') do
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
    

    # Check that more than 2 arguments have been given ...
    raise(Puppet::ParseError, "concat(): Wrong number of arguments given (#{arguments.size} for < 2)") if arguments.size < 2

    a = arguments[0]

    # Check that the first parameter is an array
    unless a.is_a?(Array)
      raise(Puppet::ParseError, 'concat(): Requires array to work with')
    end

    result = a
    arguments.shift

    arguments.each do |x|
      result += (x.is_a?(Array) ? x : [x])
    end

    return result
  
  end
end
