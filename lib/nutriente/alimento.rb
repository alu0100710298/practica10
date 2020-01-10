# Clase Alimento
# 
# Autor:: Sergio Moreno Martín
# @attr_reader nombre: devuelve el nombre del alimeto
# @attr_reader proteinas: devuelve la cantidad de proteinas
# @attr_reader carbohidratos: devuelve la cantidad de carbohidratos
# @attr_reader lipidos: devuelve la cantidad de lipidos
# @attr_reader gei: devuelve la cantidad de emisiones de gases de  efecto invernadero
# @attr_reader terreno: devuelve la cantidad de terreno utilizado


class Alimento
    attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno
    include Comparable

    # Contruye un objeto alimento según los parámetros
    def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
        @nombre = nombre
        @proteinas = proteinas
        @carbohidratos = carbohidratos
        @lipidos = lipidos
        @gei = gei
        @terreno = terreno
    end

    # Obtiene la energía de las proteínas
    def energiaProteinas()
        @proteinas * 4
    end

    # Obtiene la energía de los lipidos
    def energiaLipidos()
        @lipidos * 9
    end

    # Obtiene la energía de los glúcidos
    def energiaGlucidos()
        @carbohidratos * 4
    end

    # Calcula el valor energético total
    def valorEnergetico()
        energiaProteinas() + energiaLipidos() + energiaGlucidos()
    end

    # Devuelve los valores del alimento formateados como un string
    def to_s()
        "#{@nombre}, #{@proteinas}g, #{@carbohidratos}g, #{@lipidos}g, #{@gei} kgCO2eq, #{@terreno} m2año"
    end 

    # Metodo de comparación, devuelve -1 si es menor que other, +1 si es mayor y 0 si es igual, se utiliza para los mixins de comparable
    def <=>(other)
        return self.valorEnergetico <=> other.valorEnergetico
    end
end