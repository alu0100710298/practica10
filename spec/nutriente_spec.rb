RSpec.describe Nutriente do
  it "has a version number" do
    expect(Nutriente::VERSION).not_to be nil
  end

  describe Alimento do
		before :each do
        @ejemplo = Alimento.new("Ejemplo",1,1,1,1,1)
        @ejemplo2 = Alimento.new("Ejemplo2",2,2,2,2,2)

        @carneVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
        @carneCordero = Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
        @camarones = Alimento.new("Camarones", 17.6,1.5, 0.6, 18.0, 2.0)
        @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
        @salmon = Alimento.new("Salmón", 19.0, 0.0, 13.6, 6.0, 3.7)
        @cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
        @pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
        @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
        @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
        @lechevaca = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
        @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
        @cafe = Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
        @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
        @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
        @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

        @hombre = [@carneVaca, @queso, @tofu]
        @mujer = [@carneVaca, @salmon, @cerveza, @cerveza]

      end
    context "Se crea el alimento" do
      it "Alimento creado correctamente" do
        expect(@ejemplo).not_to be nil 
      end
    end

    context "Almacenamiento de datos" do
      it "Nombre no nulo" do
        expect(@ejemplo.nombre).not_to be nil
      end
      it "Nombre ==" do
        expect(@ejemplo.nombre).to eq("Ejemplo")
      end
      it "Proteínas no nulas" do
        expect(@ejemplo.proteinas).not_to be nil
      end
      it "Proteínas ==" do
        expect(@ejemplo.proteinas).to eq(1)
      end
      it "Carbohidratos no nulos" do
        expect(@ejemplo.carbohidratos).not_to be nil
      end
      it "Carbohidratos ==" do
        expect(@ejemplo.carbohidratos).to eq(1)
      end
      it "Lípidos no nulos" do
        expect(@ejemplo.lipidos).not_to be nil
      end
      it "Lípidos ==" do
        expect(@ejemplo.lipidos).to eq(1)
      end
      it "GEI no nulo" do
        expect(@ejemplo.gei).not_to be nil
      end
      it "GEI ==" do
        expect(@ejemplo.gei).to eq(1)
      end
      it "Terreno no nulo" do
        expect(@ejemplo.terreno).not_to be nil
      end
      it "Terreno ==" do
        expect(@ejemplo.terreno).to eq(1)
      end
    end
    context "Cáculo de valor energético" do
      it "Proteínas" do
        expect(@ejemplo.energiaProteinas()).to eq(4)
      end
      it "Lipidos" do
        expect(@ejemplo.energiaLipidos()).to eq(9)
      end
      it "Glúcidos" do
        expect(@ejemplo.energiaGlucidos()).to eq(4)
      end
      it "Valor Energético" do
        expect(@ejemplo.valorEnergetico()).to eq(17)
      end
    end
    context "Obtener alimento formateado" do
      it "to_s" do
        expect(@ejemplo.to_s()).to eq("Ejemplo, 1g, 1g, 1g, 1 kgCO2eq, 1 m2año")
      end
    end

    context "Cálculo del impacto ambiental diario hombre" do
      before :each do
        @p = 0.0
        @co2 = 0.0
        @hombre.each do | item |
          @p += item.proteinas
          @co2 += item.gei
        end
      end
      it "Hombre 54g" do
        expect(@p).to be_between(54.0,54.1).inclusive
      end
      it "Impacto Ambiental" do
        expect(@co2).to eq(63)
      end
    end

    context "Cálculo del impacto ambiental diario mujer" do
      before :each do
        @p = 0.0
        @co2 = 0.0
        @mujer.each do | item |
          @p += item.proteinas
          @co2 += item.gei
        end
      end
      it "Mujer 41g" do
        expect(@p).to be_between(41.0,41.1).inclusive
      end
      it "Impacto Ambiental" do
        expect(@co2).to be_between(56.48,56.49).inclusive
      end
    end

    context "Pruebas Comparable" do
      it "Menor" do
        expect(@ejemplo < @ejemplo2).to eq(true)
      end
      it "Igual" do
        expect(@ejemplo == @ejemplo2).to eq(false)
      end
      it "Mayor" do
        expect(@ejemplo > @ejemplo2).to eq(false)
      end
      it "Energía Proteinas" do
        @ejemplo3 = Alimento.new("Ejemplo3",1,2,3,4,5)
        expect(@ejemplo.energiaProteinas < @ejemplo3.energiaProteinas).to eq(false)
        expect(@ejemplo.energiaProteinas <= @ejemplo3.energiaProteinas).to eq(true)
        expect(@ejemplo.energiaProteinas == @ejemplo3.energiaProteinas).to eq(true)
        expect(@ejemplo.energiaProteinas > @ejemplo3.energiaProteinas).to eq(false)
        expect(@ejemplo.energiaProteinas >= @ejemplo.energiaProteinas).to eq(true)
      end
      it "CO2" do
        expect(@ejemplo.gei < @ejemplo2.gei).to eq(true)
        expect(@ejemplo.gei <= @ejemplo2.gei).to eq(true)
        expect(@ejemplo.gei == @ejemplo2.gei).to eq(false)
        expect(@ejemplo.gei > @ejemplo2.gei).to eq(false)
        expect(@ejemplo.gei >= @ejemplo2.gei).to eq(false)
      end
    end
  end

  describe Lista do
    before :each do
      @val = 1
      @ejemplo = Lista.new(@val)

      @carneVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
      @carneCordero = Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
      @camarones = Alimento.new("Camarones", 17.6,1.5, 0.6, 18.0, 2.0)
      @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
      @salmon = Alimento.new("Salmón", 19.0, 0.0, 13.6, 6.0, 3.7)
      @cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
      @pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
      @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
      @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
      @lechevaca = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
      @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
      @cafe = Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
      @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
      @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
      @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

      @DietaVasca = Lista.new(@huevos)
      @DietaVasca.insert_head(@chocolate)
      @DietaVasca.insert_head(@cerveza)
      @DietaVasca.insert_head(@lechevaca)
      @DietaVasca.insert_head(@lentejas)
      @DietaVasca.insert_head(@queso)
      @DietaVasca.insert_head(@salmon)
      @DietaVasca.insert_head(@carneVaca)

      @DietaVegetariana = Lista.new(@lechevaca)
      @DietaVegetariana.insert_head(@chocolate)
      @DietaVegetariana.insert_head(@lechevaca)
      @DietaVegetariana.insert_head(@lechevaca)
      @DietaVegetariana.insert_head(@huevos)
      @DietaVegetariana.insert_head(@nuez)
      @DietaVegetariana.insert_head(@lechevaca)
      @DietaVegetariana.insert_head(@queso)

      @DietaCarne = Lista.new(@carneVaca)
      @DietaCarne.insert_head(@carneCordero)
      @DietaCarne.insert_head(@cerdo)
      @DietaCarne.insert_head(@chocolate)
      @DietaCarne.insert_head(@pollo)
      @DietaCarne.insert_head(@lentejas)
      @DietaCarne.insert_head(@cerveza)
      @DietaCarne.insert_head(@nuez)

      @DietaTest = Lista.new(@pollo)
    end

    context "Pruebas para la creacion de listas" do
      it "se ha creado bien la lista" do
        expect(@ejemplo).not_to eq(nil)
      end
      it "Devuelve el HEAD" do
        expect(@ejemplo.head).not_to eq(nil)
      end
      it "Devuelve el TAIL" do
        expect(@ejemplo.tail).not_to eq(nil)
      end
    end
    context "Métodos de la lista" do
      it "Insertar nodo HEAD" do
        nuevo = 2
        @ejemplo.insert_head(nuevo)
        expect(@ejemplo.head.value).to eq(nuevo)
      end
      it "Insertar nodo TAIL" do
        nuevo = 2
        @ejemplo.insert_tail(nuevo)
        expect(@ejemplo.tail.value).to eq(nuevo)
      end
      it "Extraer HEAD" do
        nuevo = 2
        @ejemplo.insert_tail(nuevo)
        expect(@ejemplo.extract_head).to eq(1)
      end
      it "Extraer TAIL" do
        nuevo = 2
        @ejemplo.insert_head(nuevo)
        expect(@ejemplo.extract_tail).to eq(1)
      end
      it "to_s" do
        expect(@DietaTest.to_s).to eq("[ Pollo, 20.6g, 0.0g, 5.6g, 5.7 kgCO2eq, 7.1 m2año ]")
      end
    end
    context "Calculos" do
      it "GEI diario Dieta Vasca" do
        expect(@DietaVasca.gei_diario.round(1)).to eq(77.3)
      end
      it "GEI diario Dieta Vegetariana" do
        expect(@DietaVegetariana.gei_diario.round(1)).to eq(30.6)
      end
      it "GEI diario Dieta Carne" do
        expect(@DietaCarne.gei_diario.round(1)).to eq(86.5)
      end
      it "GEI anual Dieta Vasca" do
        expect(@DietaVasca.gei_diario.round(1) * 365).to eq(28214.5)
      end
      it "GEI anual Dieta Vegetariana" do
        expect(@DietaVegetariana.gei_diario.round(1) * 365).to eq(11169.0)
      end
      it "GEI anual Dieta Carne" do
        expect(@DietaCarne.gei_diario.round(1) * 365).to eq(31572.5)
      end
      it "Terreno Dieta Vegetariana" do
        expect(@DietaVegetariana.uso_terreno.round(1)).to eq(93.6)
      end
      it "Terreno Dieta Vasca" do
        expect(@DietaVasca.uso_terreno.round(1)).to eq(230.3)
      end
      it "Terreno Dieta Carne" do
        expect(@DietaCarne.uso_terreno.round(1)).to eq(382.0)
      end
    end
    context "Enumerable" do
      it "Collect" do
        @ejemplo.insert_head(2)
        @ejemplo.insert_head(3)
        @ejemplo.insert_head(4)
        expect(@ejemplo.collect {|i| i + i}).to eq([8, 6, 4, 2])
      end
      it "Select" do
        @ejemplo.insert_head(2)
        @ejemplo.insert_head(3)
        @ejemplo.insert_head(4)
        expect(@ejemplo.select {|i| i.even?}).to eq([4, 2])
      end
      it "Sort" do
        @ejemplo.insert_head(2)
        @ejemplo.insert_head(3)
        expect(@ejemplo.sort).to eq([1, 2, 3])
      end

      it "Min" do
        @ejemplo.insert_head(2)
        @ejemplo.insert_head(3)
        expect(@ejemplo.min).to eq(1)
      end
      it "Max" do
        @ejemplo.insert_head(2)
        @ejemplo.insert_head(4)
        @ejemplo.insert_head(3)
        expect(@ejemplo.max).to eq(4)
      end
    end
  end

  describe PlatoE do
    before :each do
      @ejemplo = Alimento.new("Ejemplo",10,8,6,4,2)
      @ejemplo2 = Alimento.new("Ejemplo 2",2,4,6,8,10)

      @listaAlimentosE = Lista.new(@ejemplo)
      @listaAlimentosE.insert_head(@ejemplo2)

      @listaAliemntosE2 = Lista.new(@ejemplo2)

      @listaGramosE = Lista.new(100)
      @listaGramosE.insert_head(100)

      @listaGramosE2 = Lista.new(200)

      @plato1 = PlatoE.new("Plato de Ejemplo", @listaAlimentosE, @listaGramosE)
      @plato2 = PlatoE.new("Plato de Ejemplo 2", @listaAliemntosE2, @listaGramosE2)
    end
    context "Pruebas para PlatoEnergía" do
      it "Tiene Nombre" do
        expect(@plato1.nombre).not_to be nil
        expect(@plato1.nombre).to eq("Plato de Ejemplo")
      end
      it "Tiene conjunto de Alimentos" do
        expect(@plato1.listaAlimentos).not_to be nil
        expect(@plato1.listaAlimentos).to be(@listaAlimentosE)
      end
      it "Tiene Conjunto de Gramos" do
        expect(@plato1.listaGramos).not_to be nil
        expect(@plato1.listaGramos).to eq(@listaGramosE)
      end
      it "Porcentaje de proteinas" do
        expect(@plato1.porcentajeProteinas).to eq(6)
      end
      it "Porcentaje de lipidos" do
        expect(@plato1.porcentajeLipidos).to eq(6)
      end
      it "Porcentaje de glucidos" do
        expect(@plato1.porcentajeGlucidos).to eq(6)
      end
      it "VCT" do
        expect(@plato1.vct).to eq(126)
      end
      it "PlatoE formateado" do
        expect(@plato1.to_s).to eq("Plato de Ejemplo, [ Ejemplo 2, 2g, 4g, 6g, 8 kgCO2eq, 10 m2año, Ejemplo, 10g, 8g, 6g, 4 kgCO2eq, 2 m2año ], [ 100, 100 ], 126")
      end
    end
    context "Comparable" do
      it "Menor" do
        expect(@plato1 < @plato2).to eq(true)
      end
      it "Mayor" do
        expect(@plato1 > @plato2).to eq(false)
      end
      it "Igual" do
        expect(@plato1 == @plato2).to eq(false)
      end
    end
  end
  
  describe PlatoA do
    before :each do
      @ejemplo = Alimento.new("Ejemplo",10,8,6,4,2)
      @ejemplo2 = Alimento.new("Ejemplo 2", 10,10,10,10,10)

      @listaAlimentosE = Lista.new(@ejemplo)
      @listaAlimentosE2 = Lista.new(@ejemplo2)

      @listaGramosE = Lista.new(100)
      @listaGramosE2 = Lista.new(200)

      @plato1 = PlatoA.new("Plato de Ejemplo", @listaAlimentosE, @listaGramosE)
      @plato2 = PlatoA.new("Plato de Ejemplo 2", @listaAlimentosE2, @listaGramosE2)
    end

    context "Pruebas PlatoA" do
      it "Tiene nombre" do
        expect(@plato1.nombre).to eq("Plato de Ejemplo")
      end 
      it "CO2" do
        expect(@plato1.co2).to eq(400)
      end
      it "Terreno" do
        expect(@plato1.terreno).to eq(200)
      end
      it "Eficiencia energetica formateada" do
        expect(@plato1.to_s).to eq("Plato de Ejemplo, [ Ejemplo, 10g, 8g, 6g, 4 kgCO2eq, 2 m2año ], [ 100 ], 126, 400.0, 200.0")
      end
      it "Jerarquia" do
        expect(@plato1.class).to eq(PlatoA)
        expect(@plato1.class.superclass).to eq(PlatoE)
        expect(@plato1.instance_of? PlatoA).to eq(true) 
        expect(@plato1.is_a? Object).to eq(true)
        expect(@plato1.is_a? BasicObject).to eq(true)
        expect(@plato.is_a? Alimento).to eq(false)
      end
    end
    context "Comparable" do
      it "Menor" do
        expect(@plato1 < @plato2).to eq(true)
      end
      it "Igual" do
        expect(@plato1 == @plato2).to eq(false)
      end
      it "Mayor" do
        expect(@plato1 > @plato2).to eq(false)
      end
    end
  end

  describe "Dietas" do
    before :each do
      @carneVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
      @carneCordero = Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
      @camarones = Alimento.new("Camarones", 17.6,1.5, 0.6, 18.0, 2.0)
      @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
      @salmon = Alimento.new("Salmón", 19.0, 0.0, 13.6, 6.0, 3.7)
      @cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
      @pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
      @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
      @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
      @lechevaca = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
      @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
      @cafe = Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
      @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
      @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
      @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

      @platolentejas = Lista.new(@lentejas)
      @platolentejas.insert_tail(@queso)
      @platolentejas.insert_tail(@pollo)

      @listaGramosLentejas = Lista.new(240)
      @listaGramosLentejas.insert_tail(30)
      @listaGramosLentejas.insert_tail(65)

      @PotajeDeLentejas = PlatoA.new("Potaje de Lentejas", @platolentejas, @listaGramosLentejas )

      @platoMenuEspañol = Lista.new(@cerdo)
      @platoMenuEspañol.insert_tail(@huevos)
      @platoMenuEspañol.insert_tail(@cafe)
      @platoMenuEspañol.insert_tail(@chocolate)

      @listaGramosMenuEspañol = Lista.new(190)
      @listaGramosMenuEspañol.insert_tail(160)
      @listaGramosMenuEspañol.insert_tail(35)
      @listaGramosMenuEspañol.insert_tail(80)

      @MenuEspañol = PlatoA.new("Almuerzo Continental", @platoMenuEspañol, @listaGramosMenuEspañol)

      @platoLentejasEstofadas = Lista.new(@lentejas)
      @platoLentejasEstofadas.insert_tail(@cerdo)

      @listaGramosLentejasEstofadas = Lista.new(210)
      @listaGramosLentejasEstofadas.insert_tail(100)

      @LentejasEstofadas = PlatoA.new("Lentejas Estofadas" , @platoLentejasEstofadas, @listaGramosLentejasEstofadas)

      @platoTiramisu = Lista.new(@chocolate)
      @platoTiramisu.insert_tail(@lechevaca)
      @platoTiramisu.insert_tail(@cafe)
      @platoTiramisu.insert_tail(@huevos)

      @listaGramosTiramisu = Lista.new(500)
      @listaGramosTiramisu.insert_tail(250)
      @listaGramosTiramisu.insert_tail(125)
      @listaGramosTiramisu.insert_tail(100)

      @Tiramisu = PlatoA.new("Tiramisu", @platoTiramisu, @listaGramosTiramisu)

      @DietaEspañola = Lista.new(@PotajeDeLentejas)
      @DietaEspañola.insert_tail(@MenuEspañol)

      @DietaVasca = Lista.new(@LentejasEstofadas)
      @DietaVasca.insert_tail(@Tiramisu)
    end
    context "Punto 8" do
      it "Menor" do
        expect(@DietaEspañola.head.value < @DietaVasca.head.value).to eq(false)
      end
      it "Igual" do
        expect(@DietaEspañola.head.value == @DietaVasca.head.value).to eq(true)
      end
      it "Mayor" do
        expect(@DietaEspañola.head.value > @DietaVasca.head.value).to eq(false)
      end
    end
    context "Punto 9" do
      it "Max" do
        expect(@DietaEspañola.max).to eq(@MenuEspañol)
      end
      it "Min" do
        expect(@DietaEspañola.min).to eq(@PotajeDeLentejas)
      end
      it "Sort" do
        expect(@DietaEspañola.sort).to eq([@PotajeDeLentejas, @MenuEspañol])
      end
      it "Select" do
        expect(@DietaEspañola.select{ |i| i.nombre== "Potaje de Lentejas"}).to eq([@PotajeDeLentejas])
      end
      it "Collect" do
        expect(@DietaEspañola.collect {|i| i.nombre}).to eq(["Potaje de Lentejas", "Almuerzo Continental"])
      end
    end

  end

  describe "Practica 9" do
    before :each do

      @carneVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
      @carneCordero = Alimento.new("Carne de Cordero",18.0,0.0,17.0,20.0,185.0)
      @camarones = Alimento.new("Camarones", 17.6,1.5, 0.6, 18.0, 2.0)
      @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
      @salmon = Alimento.new("Salmón", 19.0, 0.0, 13.6, 6.0, 3.7)
      @cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
      @pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
      @queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
      @cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
      @lechevaca = Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
      @huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
      @cafe = Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
      @tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
      @lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
      @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

      @platolentejas = Lista.new(@lentejas)
      @platolentejas.insert_tail(@queso)
      @platolentejas.insert_tail(@pollo)

      @listaGramosLentejas = Lista.new(240)
      @listaGramosLentejas.insert_tail(30)
      @listaGramosLentejas.insert_tail(65)

      @PotajeDeLentejas = PlatoA.new("Potaje de Lentejas", @platolentejas, @listaGramosLentejas )

      @platoMenuEspañol = Lista.new(@cerdo)
      @platoMenuEspañol.insert_tail(@huevos)
      @platoMenuEspañol.insert_tail(@cafe)
      @platoMenuEspañol.insert_tail(@chocolate)

      @listaGramosMenuEspañol = Lista.new(190)
      @listaGramosMenuEspañol.insert_tail(160)
      @listaGramosMenuEspañol.insert_tail(35)
      @listaGramosMenuEspañol.insert_tail(80)

      @MenuEspañol = PlatoA.new("Almuerzo Continental", @platoMenuEspañol, @listaGramosMenuEspañol)

      @platoLentejasEstofadas = Lista.new(@lentejas)
      @platoLentejasEstofadas.insert_tail(@cerdo)

      @listaGramosLentejasEstofadas = Lista.new(210)
      @listaGramosLentejasEstofadas.insert_tail(100)

      @LentejasEstofadas = PlatoA.new("Lentejas Estofadas" , @platoLentejasEstofadas, @listaGramosLentejasEstofadas)

      @platoTiramisu = Lista.new(@chocolate)
      @platoTiramisu.insert_tail(@lechevaca)
      @platoTiramisu.insert_tail(@cafe)
      @platoTiramisu.insert_tail(@huevos)

      @listaGramosTiramisu = Lista.new(500)
      @listaGramosTiramisu.insert_tail(250)
      @listaGramosTiramisu.insert_tail(125)
      @listaGramosTiramisu.insert_tail(100)

      @Tiramisu = PlatoA.new("Tiramisu", @platoTiramisu, @listaGramosTiramisu)

      @DietaEspañola = Lista.new(@PotajeDeLentejas)
      @DietaEspañola.insert_tail(@MenuEspañol)

      @DietaVasca = Lista.new(@LentejasEstofadas)
      @DietaVasca.insert_tail(@Tiramisu)

      @menu = [@PotajeDeLentejas, @MenuEspañol, @Tiramisu]
      @precios = [8,15,7]

      
    end

    context "Test para la comprobación de las listas" do
      it "Lista de platos creada correctamente" do
        expect(@menu).not_to be nil
      end
      it "Lista de precios creada correctamente" do
        expect(@precios).not_to be nil
      end
    end

    context "HUELLA NUTRICIONAL" do

      it "Huella nutricional Potaje de Lentejas y Menu Español" do
        expect(@PotajeDeLentejas.huella_nutricional).to eq(1)
        expect(@MenuEspañol.huella_nutricional).to eq(2)
        expect(@Tiramisu.huella_nutricional).to eq(2)
      end

      it "Plato con máxima huella" do
        expect(@menu.max).to eq(@MenuEspañol)
      end

      it "Cambiarle el precio al plato mayor" do
        aux = @precios.collect {|precio| precio*@menu.max.huella_nutricional*0.5}
        aux.zip(@precios).each do|precioNuevo, precioOriginal|
          expect(precioNuevo).to eq(precioOriginal*@menu.max.huella_nutricional*0.5)
        end
      end
        
    end
  end

  describe PlatoDSL do

    before :each do
  
      # Definicion de plato
      @p1 = PlatoDSL.new("Hot Dog", 200, 150) do
        ingrediente "Slachicha", :gramos => "100"
        ingrediente "Pan", :gramos => "20"
        ingrediente "Salsa de tomate", :gramos => "150"
        ingrediente "Mostaza", :gramos => "50"
        ingrediente "Cebolla", :gramos => "10"
      end
  
      @p2 = PlatoDSL.new("Papas fritas", 100, 80) do
        ingrediente "Papas", :gramos => "30"
        ingrediente "Aceite", :gramos => "10"
        ingrediente "Sal", :gramos => "5"
      end
  
      @p3 = PlatoDSL.new("Refresco", 160, 120) do
        ingrediente "Agua", :gramos => "100"
        ingrediente "Gaseosa", :gramos => "200"
        ingrediente "Azucar", :gramos => "20"
      end
  
      # Definicion de menu
      @m1 = MenuDSL.new("MiCombo",10) do
        plato @p1
        plato @p2
        plato @p3
      end
    end
  
    context 'Pruebas plato' do
      it "Se crea plato DSL" do
        expect(@p1.to_s).not_to be nil
      end
    end

    context 'Pruebas menu' do
      it "Se crea plato DSL" do
        puts @m1
        puts @p1
        puts @p2
        puts @p3
        expect(@m1.to_s).not_to be nil
      end
      end
  end

end