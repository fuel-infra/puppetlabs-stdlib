# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# merge.rb
#
# ---- original file header ----
#
# @summary
#       Merges two or more hashes together and returns the resulting hash.
#
#    For example:
#
#        $hash1 = {'one' => 1, 'two', => 2}
#        $hash2 = {'two' => 'dos', 'three', => 'tres'}
#        $merged_hash = merge($hash1, $hash2)
#        # The resulting hash is equivalent to:
#        # $merged_hash =  {'one' => 1, 'two' => 'dos', 'three' => 'tres'}
#
#    When there is a duplicate key, the key in the rightmost hash will "win."
#
#
#
Puppet::Functions.create_function(:'stdlib::merge') do
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
    

    if args.length < 2
      raise Puppet::ParseError, "merge(): wrong number of arguments (#{args.length}; must be at least 2)"
    end

    # The hash we accumulate into
    accumulator = {}
    # Merge into the accumulator hash
    args.each do |arg|
      next if arg.is_a?(String) && arg.empty? # empty string is synonym for puppet's undef
      unless arg.is_a?(Hash)
        raise Puppet::ParseError, "merge: unexpected argument type #{arg.class}, only expects hash arguments"
      end
      accumulator.merge!(arg)
    end
    # Return the fully merged hash
    accumulator
  
  end
end
