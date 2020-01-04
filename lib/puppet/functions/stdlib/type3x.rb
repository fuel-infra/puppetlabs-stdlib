# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# type3x.rb
#
# ---- original file header ----
#
# @summary
#       DEPRECATED: This function will be removed when puppet 3 support is dropped; please migrate to the new parser's typing system.
#
#    Returns the type when passed a value. Type can be one of:
#
#    * string
#    * array
#    * hash
#    * float
#    * integer
#    * boolean
#
#
Puppet::Functions.create_function(:'stdlib::type3x') do
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
    
    raise(Puppet::ParseError, "type3x(): Wrong number of arguments given (#{args.size} for 1)") unless args.size == 1

    value = args[0]

    klass = value.class

    unless [TrueClass, FalseClass, Array, Bignum, Fixnum, Float, Hash, String].include?(klass) # rubocop:disable Lint/UnifiedInteger
      raise(Puppet::ParseError, 'type3x(): Unknown type')
    end

    klass = klass.to_s # Ugly ...

    # We note that Integer is the parent to Bignum and Fixnum ...
    result = case klass
             when %r{^(?:Big|Fix)num$} then 'integer'
             when %r{^(?:True|False)Class$} then 'boolean'
             else klass
             end

    if result == 'String'
      if value == value.to_i.to_s
        result = 'Integer'
      elsif value == value.to_f.to_s
        result = 'Float'
      end
    end

    return result.downcase
  
  end
end
