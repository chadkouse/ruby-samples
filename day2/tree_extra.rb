class Tree
  attr_accessor :node_name, :children

  def initialize (name, children=[])

    if name.respond_to?(:keys)
      tmp = name.first
      name = tmp[0]
      children = tmp[1]
    end

    if children.respond_to?(:keys)
      children = children.map {|child, grandchild| Tree.new(child, grandchild)}
    end

    @node_name = name
    @children = children

    def visit_all(&block)
      visit &block
      children.each {|c| c.visit_all &block}
    end

    def visit(&block)
      block.call self
    end

  end
end

ruby_tree = Tree.new( "Ruby",
                      [Tree.new("Reia", [Tree.new("Dia")]),
                       Tree.new("MacRuby")] )
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

puts
puts '-------------------------------------------'
puts

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
