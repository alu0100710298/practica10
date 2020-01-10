# Clase PlatoE (Plato Energía)
# @author Sergio Moreno Martín
# @attr_reader nombre: Devuelve el nombre del plato
# @attr_reader listaAlimentos: Devuelve una lista de alimentos
# @attr_reader listaGramos: Devuelve una lista de gramos
# @attr_reader vct: Devuelve el valor calórico total

class PlatoE

    attr_reader :nombre, :listaAlimentos, :listaGramos, :vct
    include Comparable

    # Constructor que se le pasa por parámetro el nombre del alimento, una lista de alimentos y una lista de gramos
    def initialize(nombre, listaAlimentos, listaGramos)
        @nombre = nombre
        @listaAlimentos = listaAlimentos
        @listaGramos = listaGramos
        @vct = valorCaloricoTotal
    end

    # cacular el porcentaje de proteinas según la cantidad de gramos
    def porcentajeProteinas
        total_proteinas = 0.0
        la = @listaAlimentos.head
        lg = @listaGramos.head

        while la != nil do
            total_proteinas += (la.value.proteinas * lg.value) / 100
            la = la.next
            lg = lg.next
        end
        total_gramos = listaGramos.reduce(:+)
        porcentajeProteinas = ((total_proteinas / total_gramos) * 100).round(2)
    end

    # Calcular el procentaje de lipidos según la cantidad de gramos
    def porcentajeLipidos
        total_lipidos = 0.0
        la = @listaAlimentos.head
        lg = @listaGramos.head
        while la != nil do
            total_lipidos += (la.value.lipidos * lg.value) / 100
            la = la.next
            lg = lg.next
        end
        total_gramos = listaGramos.reduce(:+)
        porcentajeLipidos = ((total_lipidos / total_gramos) * 100).round(2)
    end

    # Calcular el porcentaje de glucidos segun la cantidad de gramos
    def porcentajeGlucidos
        total_glucidos = 0.0
        la = @listaAlimentos.head
        lg = @listaGramos.head
        while la != nil do
            total_glucidos += (la.value.carbohidratos * lg.value) / 100
            la = la.next
            lg = lg.next
        end
        total_gramos = listaGramos.reduce(:+)
        porcentajeGlucidos = ((total_glucidos / total_gramos)*100).round(2)
    end

    # calcular el valor clórico total del plato y todos sus alimentos
    def valorCaloricoTotal
        la = @listaAlimentos.head
        lg = @listaGramos.head
        while la != nil do
            resultado = (la.value.valorEnergetico * lg.value) / 100
            la = la.next
            lg = lg.next
        end
        return resultado
    end

    # Formatear la salidad de un plato tipo energía 
    def to_s
        "#{@nombre}, #{@listaAlimentos}, #{@listaGramos}, #{@vct}"
    end

    # Metodo de comparación, devuelve -1 si es menor que other, +1 si es mayor y 0 si es igual, se utiliza para los mixins de comparable
    def <=>(other)
        self.vct <=> other.vct
    end

end