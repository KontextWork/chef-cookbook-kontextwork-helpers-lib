module Compute
  module Attributes
    # This function creates a file with init system type as a content
    def defaulltIfNil(_val, _default)
      return val unless val.nil?

      default
    end
  end
end

Chef::Recipe.include(Compute::Attributes)
