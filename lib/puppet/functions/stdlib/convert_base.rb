# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# convert_base.rb
#
# ---- original file header ----
#
# @summary
#       Converts a given integer or base 10 string representing an integer to a specified base, as a string.
#
#    Usage:
#
#      $binary_repr = convert_base(5, 2)  # $binary_repr is now set to "101"
#      $hex_repr = convert_base("254", "16")  # $hex_repr is now set to "fe"
#
#
#
Puppet::Functions.create_function(:'stdlib::convert_base') do
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
    

    raise Puppet::ParseError, 'convert_base(): First argument must be either a string or an integer' unless args[0].is_a?(Integer) || args[0].is_a?(String)
    raise Puppet::ParseError, 'convert_base(): Second argument must be either a string or an integer' unless args[1].is_a?(Integer) || args[1].is_a?(String)

    if args[0].is_a?(String)
      raise Puppet::ParseError, 'convert_base(): First argument must be an integer or a string corresponding to an integer in base 10' unless args[0] =~ %r{^[0-9]+$}
    end

    if args[1].is_a?(String)
      raise Puppet::ParseError, 'convert_base(): First argument must be an integer or a string corresponding to an integer in base 10' unless args[1] =~ %r{^[0-9]+$}
    end

    number_to_convert = args[0]
    new_base = args[1]

    number_to_convert = number_to_convert.to_i
    new_base = new_base.to_i

    raise Puppet::ParseError, 'convert_base(): base must be at least 2 and must not be greater than 36' unless new_base >= 2 && new_base <= 36

    return number_to_convert.to_s(new_base)
  
  end
end
