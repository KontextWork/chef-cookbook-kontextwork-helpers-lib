[![Build Status](https://travis-ci.com/KontextWork/chef-cookbook-kontextwork-helpers-lib.svg?branch=master)](https://travis-ci.com/KontextWork/chef-cookbook-kontextwork-helpers-lib)

# WAT

Provides helper methods for other cookbooks - a shared library

# Library

**valOrDefault**

```ruby
# does return val, if val is not nil, otherwise uses default
# Very handy if you want to pick either one value, if it exist, or the node.default or similar
def valOrDefault(val, default)
```

Usage example. add `depends "kontextwork-helpers-lib` to your `metadata.rb`

```ruby
# if node[:key][:nested1][:nested2] is set, return that value, otherwise "other"
valOrDefault(node.dig(:key,:nested1, :nested2), "other")
valOrDefault(node.dig(:key,:nested1, :nested2), node.default.dig(:key,:nested1, :nested2))
```

**nodeOrDefaultAttr**

```ruby
# does return val, if val is not nil, otherwise uses default
# Very handy if you want to pick either one value, if it exist, or the node.default or similar
def nodeOrDefaultAttr(*keys)
```

Usage example. add `depends "kontextwork-helpers-lib` to your `metadata.rb`

```ruby
# if node[:key][:nested1][:nested2] is set, return it, otherwise return node.default[:key][:nested1][:nested2]
# or if even that is missing, return nil
nodeOrDefaultAttr(:key,:nested1, :nested2))
```

# Tests

The test provision via `dokken`, so be sure to have a docker engine running

    make prepare
    make test

## Attribute tests

Right now we are testing the different sources and aspects of attribute precendence

- `attribute-test` uses kitchen node `attributes` and tests if you can override `node.default` values with it
  The result is: no
- `default-attribute-test` uses `default_attributes` as node attributes, which seem to no be supported at all
- `roles-attribute-test` uses the role at `test/integration/roles/attributes_test.json` to define `default_attributes`
  and the run list. The result of this is fairly suprising, the entire order is messed up
