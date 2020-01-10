# Clase PlatoA (Plato Ambiental)
# @author Sergio Moreno Martín
# @attr_reader nombre: nombre del plato
# @attr_reader listaAlimentos: lista de alimentos 
# @attr_reader listaGramos: lista de gramos
# @attr_reader co2: Valor total de co2
# @attr_reader terreno: terreno total
class PlatoA < PlatoE

    attr_reader :nombre, :listaAlimentos, :listaGramos, :co2, :terreno
    include Comparable

    # Constructo que se le pasa por parametros el nombre del plato, una lista de alimentos y una lista de gramos
    def initialize(nombre, listaAlimentos, listaGramos)
        super(nombre, listaAlimentos, listaGramos)
        @co2 = valorTotalCO2
        @terreno = terrenoTotal

    end

    # calcular el valor total de CO2
    def valorTotalCO2
        la = @listaAlimentos.head
        lg = listaGramos.head
        totalCO2 = 0.0
        while la != nil do
            totalCO2 = totalCO2 + la.value.gei * lg.value
            la = la.next
            lg = lg.next
        end
        return totalCO2
    end

    # calcular el uso del terreno total
    def terrenoTotal
        la = @listaAlimentos.head
        lg = listaGramos.head
        totalCO2 = 0.0
        while la != nil do
            totalTerreno = totalCO2 + la.value.terreno * lg.value
            la = la.next
            lg = lg.next
        end
        return totalTerreno
    end

    # Formatear la salida de un plato ambiental como un string
    def to_s
        "#{@nombre}, #{@listaAlimentos}, #{@listaGramos}, #{@vct}, #{@co2}, #{@terreno}"
    end

    # Metodo de comparación, devuelve -1 si es menor que other, +1 si es mayor y 0 si es igual, se utiliza para los mixins de comparable
    def <=>(other)
        self.huella_nutricional <=> other.huella_nutricional
    end

    # calculo de la huella nutricional, comprando la energía (vct) y el carbono(co2), realizando después la media
    def huella_nutricional
        @energia
        if self.vct< 670
            @energia = 1
        elsif self.vct >= 670 && self.vct < 830
            @energia = 2
        else
            @energia = 3
        end

        @carbono
        if self.co2 < 800
            @carbono = 1
        elsif self.co2 >= 800 && self.co2 < 1200
            @carbono = 2
        else
            @carbono = 3
        end

        return (@energia + @carbono)/2
    end

end