class PlatoDSL

	attr_accessor :nombre, :ingredientes, :vn, :va
	
	def initialize(nombre, vn, va, &block)
	
		@nombre = nombre
		@vn = vn
		@va = va
		@ingredientes = []
		
		if block_given?  
			if block.arity == 1
				yield self
			else
				instance_eval(&block) 
			end
		end
	end
	
	def to_s
		output = @nombre
		output << " | Valor Nutricional: #{@vn} | Valor Ambiental: #{@va} | Ingredientes: #{@ingredientes.join(', ')}\n"
		output
	end     
	
	
	def ingrediente(nombre, opcion = {})
		ingrediente = nombre
		ingrediente << " (#{opcion[:gramos]})" if opcion[:gramos]
		@vn = " (#{opcion[:vn]})" if opcion[:vn]
		@va = " (#{opcion[:va]})" if opcion[:va]
		@ingredientes << ingrediente
	end
end