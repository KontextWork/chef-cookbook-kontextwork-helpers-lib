module Site
  module Attributes
    # This function creates a file with init system type as a content
    def valOrDefault(val, default)
      return val unless val.nil?

      default
    end

    # given the nested keys like :foo, :bar, :foo tries to fetch it from node.normal attributes (so node source)
    # but if not present, tries to get them from node.default attributes
    def nodeOrDefaultAttr(*keys)
      valOrDefault(node.dig(*keys), node.default.dig(*keys))
    end
  end
end

Chef::Recipe.include(Site::Attributes)
Chef::Resource.include(Site::Attributes)
