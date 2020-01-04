# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
#  delete_regex.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
# ---- original file header ----
#
# @summary
#       deletes all instances of a given element that match a regular expression
#    from an array or key from a hash. Multiple regular expressions are assumed
#    to be matched as an OR.
#
#    *Examples:*
#
#        delete_regex(['a','b','c','b'], 'b')
#        Would return: ['a','c']
#
#        delete_regex(['a','b','c','b'], ['b', 'c'])
#        Would return: ['a']
#
#        delete_regex({'a'=>1,'b'=>2,'c'=>3}, 'b')
#        Would return: {'a'=>1,'c'=>3}
#
#        delete_regex({'a'=>1,'b'=>2,'c'=>3}, '^a$')
#        Would return: {'b'=>2,'c'=>3}
#
#
#
Puppet::Functions.create_function(:'stdlib::delete_regex') do
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
    

    raise(Puppet::ParseError, "delete_regex(): Wrong number of arguments given #{arguments.size} for 2") unless arguments.size == 2

    collection = arguments[0].dup
    Array(arguments[1]).each do |item|
      case collection
      when Array, Hash, String
        collection.reject! { |coll_item| (coll_item =~ %r{\b#{item}\b}) }
      else
        raise(TypeError, "delete_regex(): First argument must be an Array, Hash, or String. Given an argument of class #{collection.class}.")
      end
    end
    collection
  
  end
end
