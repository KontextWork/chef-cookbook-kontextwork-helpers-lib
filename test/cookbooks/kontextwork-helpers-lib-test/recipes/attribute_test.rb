def showstate(segment)
  log "---------- #{segment} ----------------" do
    level :info
  end

  log "node.default: #{node.default[:mykey][:nested1]}" do
    level :info
  end

  log "node.normal: #{node.normal.dig(:mykey, :nested1)}" do
    level :info
  end

  log "node: #{node.dig(:mykey, :nested1)}" do
    level :info
  end

  log "pickNodeOtherWiseDefaultAttribute: #{nodeOrDefaultAttr(:mykey, :nested1)}" do
    level :info
  end
end

showstate('no manipulations')

node.default[:mykey][:nested1] = 'val2'
showstate('after node.default set to val2')

node.default[:mykey][:nested1] = valOrDefault(node.dig(:mykey, :nested1), 'def value')
showstate('after set node.default from node.normal')

node.normal[:mykey][:nested1] = 'new_normal'
showstate('after node.normal set to new_normal')
