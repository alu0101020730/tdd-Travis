##
# Clase plato que representa un menu con varios alimentos
class Plato

	attr_reader :nombre
	
	##
	# Metodo inicializador que recibe el menu y el nombre de dicho menu
	def initialize(nombre, platos)
		@nombre = nombre
		@platos = List.new
		for plato in platos do
			@platos << plato
		end
	end

	##
	# Metodo to_s que devuelve los nombres de los alimentos del menu
	def to_s
		@platos.each do |alimento|
			puts alimento.nombre
		end
	end
		
	##
	# Devuelve el objeto lista donde se almacenan los platos
	def platos
		return @platos
	end

	##
	# Calcula el porcentaje de proteinas del menu
	def pProteina 
		prot = 0
		total = 0
		@platos.each do |alimento|
			total += (alimento.proteinas + alimento.lipidos + alimento.carbohidratos)
			prot += alimento.proteinas
		end
		return ((prot/total)*100).round	
	end
	
	##
	# Calcula el total de proteinas del menu
	def totalProteina 
		prot = 0
		total = 0
		@platos.each do |alimento|
			prot += alimento.proteinas
		end
		return prot.round(2)
	end

	##
	# Calcula el porcentaje de lipidos del menu
	def pLipidos
		lip = 0
		total = 0
		@platos.each do |alimento|
			total += alimento.proteinas + alimento.lipidos + alimento.carbohidratos
			lip += alimento.lipidos
		end
		return ((lip/total)*100).round
	
	end

	##
	# Calcula el total de lipidos del menu
	def totalLipidos
		lip = 0
		total = 0
		@platos.each do |alimento|
			lip += alimento.lipidos
		end
		return lip.round(2)
	
	end

	##
	# Calcula el porcentaje de hidratos del menu
	def pHidratos
		hidr = 0
		total = 0
		@platos.each do |alimento|
			total += alimento.proteinas + alimento.lipidos + alimento.carbohidratos
			hidr += alimento.carbohidratos
		end
		return ((hidr/total)*100).round

	
	end

	##
	# Calcula el total de hidratos del menu
	def totalHidratos
		hidr = 0
		total = 0
		@platos.each do |alimento|
			hidr += alimento.carbohidratos
		end
		return hidr.round(2)
	end

	##
	# Calcula el total de gramos del menu
	def totalGramos
		gramos = 0
		total = 0
		@platos.each do |alimento|
			gramos += alimento.gramos
		end
		return gramos.round(2)
	end

	##
	# Calcula el valor calorico del menu
	def vCalorico
		calc = Calculadora.new
		valCal = 0		
		@platos.each do |alimento|
			valCal += calc.valorKiloCalorico(alimento)
		end
		return valCal.round(2)
	end

	##
	# Vacia el menu
	def clear
		@platos = List.new
	end


end

##
# Clase hija de plato que calucla la eficiencia del menu, incluye comparable y enumerable
class EficPlato < Plato


include Comparable
include Enumerable
	
	attr_reader :geiSuma, :terrenoSuma


	##
	# Metodo inicializador que recibe el nombre del menu y el menu y declara metodos
	# funcionales
	def initialize(nombre, platos)
		super(nombre, platos)
	
		@indEnergia = -> { if vCalorico < 670
					1
				   elsif vCalorico >= 670 && vCalorico <= 830
					2
				   elsif vCalorico > 830
					3
				   end
				  }

		@indGei = -> { if geiTotal < 800 
					1
				   elsif geiTotal >= 800 && geiTotal <= 1200
					2
				   elsif geiTotal > 1200
					3
				   end
			     }
	end

	##
	# Calcula el gei total del menu
	def geiTotal
		@geiSuma = 0
		@platos.each do |alimento|
			@geiSuma += alimento.gei
		end
		return @geiSuma.round(2)
	end

	##
	# Calcula el terreno total del menu
	def terrenoTotal
		@terrenoSuma = 0
		@platos.each do |alimento|
			@terrenoSuma += alimento.terreno
		end
		return @terrenoSuma.round(2)
	end

	##
	# Recorre el menu
	def each
		@platos.each do |alimento|
			yield alimento
		end
	end

	##
	# Metodo funcional que calula la huella nutricional
	def huellaNut 
		(@indEnergia.call + @indGei.call)/2.0
	end

	##
	# Establece la condicion de comparacion con otra instancia de la misma clase	
	def <=> otro
		huellaNut <=> otro.huellaNut
	end

end

class PlatoDSL < EficPlato

	def initialize(name, &block)
	    @comida = []
	    if block_given?  
	      if block.arity == 1
		yield self
	      else
	       instance_eval(&block) 
	      end
	    end
	
	super(name, @comida)
        end

	def alimento(informacion = {})
		alimento = Alimentos.new(informacion[:nombre],informacion[:proteina],
		informacion[:carbohidrato],informacion[:lipido],informacion[:gei],informacion[:terreno], informacion[:gramos])
		@comida << alimento
	end

	def to_s
		text = ""
		@platos.each do |alimento|
			text << "#{alimento.nombre} => Proteinas: #{alimento.proteinas}, Carbohidratos: #{alimento.carbohidratos}, Lipidos: #{alimento.lipidos}, GEI: #{alimento.gei}, Terreno: #{alimento.terreno}, Gramos: #{alimento.gramos}\n"
		end
		text
	end
	
 


















end



