module Site
  module Attributes
    # This function creates a file with init system type as a content
    def defaultIfNil(_val, _default)
      return val unless val.nil?

      default
    end
  end
end

Chef::Recipe.include(Site::Attributes)
Chef::Resource.include(Site::Attributes)
