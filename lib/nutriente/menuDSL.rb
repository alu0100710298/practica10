class MenuDSL

    attr_accessor :nombre, :platos, :precio

    def initialize(nombre, precio, &block)
        @nombre = nombre
        @precio = precio
        @platos = []

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
		output << " #{@precio}€"
		output << "\n#{'-' * @nombre.size}\n"
		#output << "#{puts @platos}\n"
		output
	end     
	
	
	def plato(p, opcion = {})
		@platos << p
	end
end