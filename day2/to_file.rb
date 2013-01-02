module ToFile
	def filename
		"object_#{self.object_id}.txt"
	end

	def to_f
		File.open(filename, 'w') {|f| f.write(to_s)}
	end
end

class Person
	include ToFile
	attr_accessor :name
	def initialize(name)
		@node_name = name
	end

	def to_s
		node_name
	end
end

Person.new('chad').to_f
