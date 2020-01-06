RSpec.describe Gema do
=begin
  describe "Practica 6" do

  	it "Probando constructor" do
   		@CarneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
   		expect(@CarneVaca).to be_truthy
  	end
		it "Probando existencia de valores" do
			@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
			expect(@carneVaca.nombre).to be_truthy
			expect(@carneVaca.proteinas).to be_truthy
			expect(@carneVaca.carbohidratos).to be_truthy
			expect(@carneVaca.lipidos).to be_truthy
			expect(@carneVaca.gei).to be_truthy
			expect(@carneVaca.terreno).to be_truthy 
		end

		it "Probando calculo de kcal de un alimento" do
			@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
			@calculadora = Calculadora.new()
			expect(@calculadora.valorKiloCalorico(@carneVaca)).to eq(112.3)
		end
 
		it "Probando el calculo ambiental del menu de hombre y mujer" do
			@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
			@carneCordero = Alimentos.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
			@camarones = Alimentos.new("Camarones",17.6,1.5,0.6,18.0,2.0)
			@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
			@salmon = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
			@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
			@pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
			@queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
			@cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
			@lecheVaca = Alimentos.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
			@huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
			@cafe = Alimentos.new("Cafe",0.1,0.0,0.0,0.4,0.3)
			@tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
			@lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
			@nuez = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)

			@calculadora = Calculadora.new()

			menuUnoHombre = [@carneVaca, @carneVaca, @queso]
			menuDosMujer = [@salmon, @cerdo]
		
			expect(@calculadora.impactoAmbientalTerreno(menuUnoHombre)).to eq(369)
			expect(@calculadora.impactoAmbientalGEI(menuUnoHombre)).to eq(111)

			expect(@calculadora.impactoAmbientalTerreno(menuDosMujer)).to eq(14.7)
			expect(@calculadora.impactoAmbientalGEI(menuDosMujer)).to eq(13.6)
			
		end
end

  describe "Practica 7" do
    
		describe "Lista" do

			before :all do
				@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
				@carneCordero = Alimentos.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
				@camarones = Alimentos.new("Camarones",17.6,1.5,0.6,18.0,2.0)
				@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
				@salmon = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
				@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
				@pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
				@queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
				@cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
				
			end

		before :each do
			@list = List.new
		end

			it "Existencia nodo" do
				@nodo = Node.new(@carneVaca,@carneCordero, @camarones)				
				expect(@nodo.value).to be_truthy
				expect(@nodo.prev).to be_truthy
				expect(@nodo.next).to be_truthy
			end

			it "Existencia Lista con cabeza y cola" do
				expect(@list.head).to be_nil
				expect(@list.tail).to be_nil 
			end 
			
			it "Insertar uno y varios elementos en la lista" do
				@list << @carneVaca
				expect(@list.sz).to eq(1)
				@list << @carneCordero << @camarones
				expect(@list.sz).to eq(3)
			end 
 
			it "Extraer primer y ultimo elemento" do
				@list << @carneCordero << @camarones << @carneVaca
				@list.pop
				expect(@list.to_a).to eq([@carneCordero,@camarones])
				@list << @carneVaca
				@list.shift
				expect(@list.to_a).to eq([@camarones, @carneVaca]) 
			end
		
			it "Unshift e insert" do
			@list << @carneCordero << @camarones << @carneVaca << @chocolate << @salmon
			@list.unshift(@queso)
			expect(@list.to_a).to eq([@queso, @carneCordero, @camarones, @carneVaca, @chocolate, @salmon])
			@list.insert(0, @cerveza)
			expect(@list.to_a).to eq([@cerveza, @queso, @carneCordero, @camarones, @carneVaca, @chocolate, @salmon])
			@list.insert(3, @pollo)
			expect(@list.to_a).to eq([@cerveza, @queso, @carneCordero, @pollo, @camarones, @carneVaca, @chocolate, @salmon]) 
			end 

		end	

		describe "Menus" do

			before :all do
				@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
				@carneCordero = Alimentos.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
				@camarones = Alimentos.new("Camarones",17.6,1.5,0.6,18.0,2.0)
				@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
				@salmon = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
				@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
				@pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
				@queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
				@cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
				@lecheVaca = Alimentos.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
				@huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
				@cafe = Alimentos.new("Cafe",0.1,0.0,0.0,0.4,0.3)
				@tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
				@lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
				@nuez = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
				

				@espanola = List.new
				@vasca = List.new
				@vegetaria = List.new
				@vegetaliana = List.new
				@locuraPorLaCarne = List.new
		
				@espanola << @chocolate << @queso << @huevos << @carneVaca
				@vasca << @lentejas << @nuez << @carneCordero << @salmon
				@vegetaria << @lecheVaca << @huevos << @lentejas
				@vegetaliana << @tofu << @lentejas << @nuez 
				@locuraPorLaCarne << @carneVaca << @pollo << @lecheVaca << @cafe
				
			end

			it "Gases de efecto invernadero diaria" do
				expect(@espanola.geiDiario).to eq(67.5)
				expect(@vasca.geiDiario).to eq(26.7)
				expect(@vegetaria.geiDiario).to eq(7.8)
				expect(@vegetaliana.geiDiario).to eq(2.7)
				expect(@locuraPorLaCarne.geiDiario).to eq(59.3)		
			end
			
			it "Gases de efecto invernadero anual" do
				expect(@espanola.geiAnual).to eq(24637.5)
				expect(@vasca.geiAnual).to eq(9745.5)   
				expect(@vegetaria.geiAnual).to eq(2847.0)
				expect(@vegetaliana.geiAnual).to eq(985.5)
				expect(@locuraPorLaCarne.geiAnual).to eq(21644.5)		
			end
			
			it "Terreno usado anualmente" do
				expect(@espanola.terrenoAnual).to eq(214.1) 
				expect(@vasca.terrenoAnual).to eq(200.0)   
				expect(@vegetaria.terrenoAnual).to eq(18.0)
				expect(@vegetaliana.terrenoAnual).to eq(13.5)
				expect(@locuraPorLaCarne.terrenoAnual).to eq(180.3)
			end

		end
  end

  describe "Practica 8" do

		before :all do  
			@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
			@carneCordero = Alimentos.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
			@camarones = Alimentos.new("Camarones",17.6,1.5,0.6,18.0,2.0)
			@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
			@salmon = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
			@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
			@pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
			@queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
			@cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
			@lecheVaca = Alimentos.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
			@huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
			@cafe = Alimentos.new("Cafe",0.1,0.0,0.0,0.4,0.3)
			@tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
			@lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
			@nuez = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
			
	
		end

	describe "Jerarquia y mixin" do 
		it "Jerarquia de clases" do 
			@efiEnerg = EfEnergetica.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0,214.0)
			expect(@efiEnerg.is_a?Alimentos).to eq(true)
		end

		it 'Operador ==' do   
	      		expect(@carneVaca == @camarones).to eq(false)
	      		expect(@carneVaca == @carneVaca).to eq(true)
	    	end

	    	it 'Operador !=' do   
	      		expect(@carneVaca != @camarones).to eq(true)
	     		expect(@carneVaca != @carneVaca).to eq(false)
	    	end

	    	it 'Operador <' do    
	      		expect(@carneVaca < @camarones).to eq(false)
	      		expect(@camarones < @carneVaca).to eq(true)
	      		expect(@carneVaca < @carneVaca).to eq(false)
	    	end

	    	it 'Operador <=' do
	      		expect(@carneVaca <= @carneVaca).to eq(true)
	      		expect(@carneVaca <= @camarones).to eq(false)
			expect(@camarones <= @carneVaca).to eq(true)
	    	end

	    	it 'Operador >' do
	      		expect(@carneVaca > @camarones).to eq(true)
	      		expect(@carneVaca > @carneVaca).to eq(false)
	      		expect(@camarones > @carneVaca).to eq(false)
	    	end

	   	it 'Operador >=' do
		      	expect(@carneVaca >= @camarones).to eq(true)
	      		expect(@carneVaca >= @carneVaca).to eq(true)
	      		expect(@camarones >= @carneVaca).to eq(false)
	    	end
	end
	
	describe "Enumerable y collect, select, max, min y sort" do
		before :all do
			@lista = List.new
			@lista << @chocolate << @queso << @huevos << @carneVaca
		end

		it "Lista enumerable" do
			@lista.each do |alimento|
			  expect(alimento.is_a?Alimentos).to eq(true)
			end  
		end

		it 'Método collect' do
		      array_nombre = @lista.collect {|alimento| alimento.nombre}
		      expect(array_nombre).to eq(['Chocolate', 'Queso', 'Huevos', 'Carne de vaca'])
		end
 
		it 'Método select' do
		      array_terreno = @lista.select {|alimento| alimento.terreno > 100}
		      expect(array_terreno).to eq([@carneVaca])
		end

		it 'Método max' do
		      expect(@lista.max).to eq(@carneVaca)
		end

		it 'Método min' do
		      expect(@lista.min).to eq(@chocolate)
		end

		it "Método sort" do
		      expect(@lista.sort).to eq([@chocolate,@huevos,@queso,@carneVaca])

		end
	end

	describe "Clase Plato" do 
		
		before :all do
			@comida = [@carneVaca, @pollo, @queso]
			@menu = Plato.new("Nombre", @comida)
		end

		it "Constructor" do
			@comida = [@carneVaca, @pollo, @queso]
			@menu = Plato.new("Nombre", @comida)
			expect(@menu).to be_truthy
		end
		
		it "Existe un conjunto de alimentos" do
			expect(@menu.platos.to_a).to eq([@carneVaca, @pollo, @queso])
		end
 
 		it "Porcentajes" do 
			expect(@menu.pProteina).to eq(61)
			expect(@menu.pLipidos).to eq(38)
			expect(@menu.pHidratos).to eq(1)
		end 
		
		it "Valor calorico" do
			expect(@menu.vCalorico).to eq(647.3)
		end

		it "Vaciar menu" do
			@menu.clear
			expect(@menu.platos.to_a).to eq([])
		end
 
	end 
	
	describe "Jerarquia clase Plato" do 
		
		before :all do
			@comida = [@carneVaca, @pollo, @queso]
			@eficPlato = EficPlato.new("Nombre", @comida)
		end

		it "Valor total GEI y uso de terreno" do
			expect(@eficPlato.geiTotal).to eq(66.7)
			expect(@eficPlato.terrenoTotal).to eq(212.1)
		end
		
		it "Clase, tipo y jerarquia" do
			expect(@eficPlato.is_a?EficPlato).to eq(true)
			expect(@eficPlato.is_a?Plato).to eq(true)
			expect(@eficPlato.is_a?Object).to eq(true)
		end
	

 		it "Comparacion entre instancias de EficPlato" do
			@comidaDos = [@lentejas, @chocolate, @huevos]
			@eficPlatoDos = EficPlato.new("Menu Dos", @comidaDos) 
			expect(@eficPlato == @eficPlatoDos).to eq(false)
			expect(@eficPlato != @eficPlatoDos).to eq(true) 
			expect(@eficPlato < @eficPlatoDos).to eq(false)
			expect(@eficPlato <= @eficPlatoDos).to eq(false)
			expect(@eficPlato > @eficPlatoDos).to eq(true)
			expect(@eficPlato >= @eficPlatoDos).to eq(true)
		end


		it "Comparacion entre dietas" do 
			@espanola = [@chocolate, @queso, @huevos, @carneVaca]
			@vasca = [@lentejas, @nuez, @carneCordero, @salmon]
			@vegetaria = [@lecheVaca, @huevos, @lentejas]
			@vegetaliana = [@tofu, @lentejas, @nuez] 
			@locuraPorLaCarne = [@carneVaca, @pollo, @lecheVaca, @cafe]

			@efEspanola = EficPlato.new("Espanola", @espanola)
			@efVasca = EficPlato.new("Vasca", @vasca)
			@efVegetaria = EficPlato.new("Vegetaria", @vegetaria)
			@efVegetaliana = EficPlato.new("Vegetaliana", @vegetaliana)
			@efLocuraPorLaCarne = EficPlato.new("Locura por la carne", @locuraPorLaCarne)
			
			expect(@efEspanola == @efEspanola).to eq(true)	
			expect(@efEspanola != @efVasca).to eq(true)	
			expect(@efEspanola < @efVegetaria).to eq(false)	
			expect(@efEspanola <= @efVegetaliana).to eq(false)	
			expect(@efEspanola >= @efLocuraPorLaCarne).to eq(true)	
			expect(@efEspanola > @efLocuraPorLaCarne).to eq(true)
			
		end
	end 

	describe "Enumerable y collect, select, max, min y sort de Platos" do
		before :all do
			@espanola = [@chocolate, @queso, @huevos, @carneVaca]
			@vasca = [@lentejas, @nuez, @carneCordero, @salmon]
			@vegetaria = [@lecheVaca, @huevos, @lentejas]
			@vegetaliana = [@tofu, @lentejas, @nuez] 
			@locuraPorLaCarne = [@carneVaca, @pollo, @lecheVaca, @cafe]

			@efEspanola = EficPlato.new("Espanola", @espanola)
			@efVasca = EficPlato.new("Vasca", @vasca)
			@efVegetaria = EficPlato.new("Vegetaria", @vegetaria)
			@efVegetaliana = EficPlato.new("Vegetaliana", @vegetaliana)
			@efLocuraPorLaCarne = EficPlato.new("Locura por la carne", @locuraPorLaCarne)
		end

		it "Lista enumerable" do  
			@efEspanola.each do |alimento|
			  expect(alimento.is_a?Alimentos).to eq(true)
			end  
		end

		it 'Método collect' do 
		      array_efVasca = @efVasca.collect {|alimento| alimento.nombre}
		      expect(array_efVasca).to eq(['Lentejas', 'Nuez', 'Carne de cordero', 'Salmon'])
		end
 
		it 'Método select' do
		      array_efVegetariana = @efVegetaria.select {|alimento| alimento.terreno > 5}
		      expect(array_efVegetariana).to eq([@lecheVaca, @huevos])
		end

		it 'Método max' do
		      expect(@efEspanola.max).to eq(@carneVaca)
		end

		it 'Método min' do
		      expect(@efVegetaliana.min).to eq(@lentejas)
		end

		it "Método sort" do
		      expect(@efLocuraPorLaCarne.sort).to eq([@cafe,@lecheVaca,@pollo,@carneVaca])
		end
	end
  end


    describe "Practica 9" do
	before :all do  
		@carneVaca = Alimentos.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
		@carneCordero = Alimentos.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
		@camarones = Alimentos.new("Camarones",17.6,1.5,0.6,18.0,2.0)
		@chocolate = Alimentos.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
		@salmon = Alimentos.new("Salmon",19.9,0.0,13.6,6.0,3.7)
		@cerdo = Alimentos.new("Cerdo",21.5,0.0,6.3,7.6,11.0)
		@pollo = Alimentos.new("Pollo",20.6,0.0,5.6,5.7,7.1)
		@queso = Alimentos.new("Queso",25.0,1.3,33.0,11.0,41.0)
		@cerveza = Alimentos.new("Cerveza",0.5,3.6,0.0,0.24,0.22)
		@lecheVaca = Alimentos.new("Leche de vaca",3.3,4.8,3.2,3.2,8.9)
		@huevos = Alimentos.new("Huevos",13.0,1.1,11.0,4.2,5.7)
		@cafe = Alimentos.new("Cafe",0.1,0.0,0.0,0.4,0.3)
		@tofu = Alimentos.new("Tofu",8.0,1.9,4.8,2.0,2.2)
		@lentejas = Alimentos.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
		@nuez = Alimentos.new("Nuez",20.0,21.0,54.0,0.3,7.9)
		
		@comidaUno = [@nuez, @salmon, @cerveza]
		@comidaDos = [@tofu, @huevos, @cafe]
		@comidaTres = [@queso, @cerveza, @pollo]
		@comidaCuatro = [@lecheVaca, @cafe]
		@menuUno = EficPlato.new("MenuUno", @comidaUno)
		@menuDos = EficPlato.new("MenuDos", @comidaDos)
		@menuTres = EficPlato.new("MenuTres", @comidaTres)
		@menuCuatro = EficPlato.new("MenuCuatro", @comidaCuatro)
		@menuDietetico = [@menuUno, @menuDos, @menuTres, @menuCuatro]
		@precios = [25.0, 15.0, 18.0, 7.5]
		#El menu con mas huella nutricional siempre va a ser el mas caro, porque es el que
		#mas cuesta hacer	
	end		
	
	it "Huella nutricional menu" do  
		expect(@menuUno.huellaNut).to eq(2)	
		expect(@menuDos.huellaNut).to eq(1)	    
	end    

	it "Maxima huella nutricional" do  
		expect(@menuDietetico.max).to eq(@menuUno)
	end  
 	
	it "Proporcion precios" do
		expect(@precios.select{ |num| num < @precios.max}.map{ |num| num * @menuDietetico.max.huellaNut}).to eq([30.0, 36.0, 15.0])
	end


  end
=end

  describe "Practica 10" do
	it "Prueba Diseño" do
		platoUno = PlatoDSL.new("Platos carnicos")do
	        alimento  :nombre => "Carne de Vaca",
		          :proteina => 21.1,
		          :carbohidrato => 0.0,
		          :lipido => 3.1,
		          :gei => 50.0,
		          :terreno => 164.0,
		          :gramos => 100
	        alimento  :nombre => "Cerdo",
		          :proteina => 21.5,
		          :carbohidrato => 0.0,
		          :lipido => 6.3,
		          :gei => 7.6,
		          :terreno => 11.0,
		          :gramos => 100
	        alimento  :nombre => "Cerveza",
		          :proteina => 0.5, 
		          :carbohidrato => 3.6,
		          :lipido => 0.0,
		          :gei => 0.24, 
		          :terreno => 0.22,
		          :gramos => 100
	     end

 		platoDos = PlatoDSL.new("Platos marineros")do
	        alimento  :nombre => "Salmon",
		          :proteina => 19.9,
		          :carbohidrato => 0.0,
		          :lipido => 13.6,
		          :gei => 6.0,
		          :terreno => 3.7,
		          :gramos => 100
	        alimento  :nombre => "Salmon",
		          :proteina => 19.9,
		          :carbohidrato => 0.0,
		          :lipido => 13.6,
		          :gei => 6.0,
		          :terreno => 3.7,
		          :gramos => 100
	        alimento  :nombre => "Salmon",
		          :proteina => 19.9, 
		          :carbohidrato => 0.0,
		          :lipido => 13.6,
		          :gei => 6.0, 
		          :terreno => 3.7,
		          :gramos => 100
	     end

		platoTres = PlatoDSL.new("Platos de desayuno")do
	        alimento  :nombre => "Cafe",
		          :proteina => 0.1,
		          :carbohidrato => 0.0,
		          :lipido => 0.0,
		          :gei => 0.4,
		          :terreno => 0.3,
		          :gramos => 20
	        alimento  :nombre => "Leche de Vaca",
		          :proteina => 3.3,
		          :carbohidrato => 4.8,
		          :lipido => 3.2,
		          :gei => 3.2,
		          :terreno => 8.9,
		          :gramos => 50
	        alimento  :nombre => "Queso",
		          :proteina => 25.0, 
		          :carbohidrato => 1.3,
		          :lipido => 33.0,
		          :gei => 11.0, 
		          :terreno => 41.0,
		          :gramos => 20
	     end
	     @menu = MenuDSL.new("Menu Completo") do
		componente   :descripcion => "Carne de vaca y cerdo con cerveza",
			     :platos => platoUno,
			     :precio => 60  
		componente   :descripcion => "Menu para los verdaderos marineros",
			     :platos => platoDos,
			     :precio => 30  
		componente   :descripcion => "Cafe, leche y un poco de queso para empezar el dia",
			     :platos => platoTres, 
			     :precio => 12   
	    end
	    expect(platoUno).to be_truthy   
	    expect(@menu).to be_truthy  
		puts @menu 
	end    
 		 


  end
 

end
