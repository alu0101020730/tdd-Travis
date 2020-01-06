##
# Clase encargada de calcular diferentes valores de impacto de los alimentos
class Calculadora

	##
	# Crea una instancia, no necesita de ningun valor
	def initialize()
	end

	##
	# Calcula el valor kilo calorico de una comida
	def valorKiloCalorico(comida)
		aux = ((comida.proteinas * 4) + (comida.lipidos * 9) + (comida.carbohidratos * 4))
		return aux.round(2)	
	end

	##
	# Calcula el impacto ambiental del terreno de una comida
	def impactoAmbientalTerreno(menu)
		aux = 0
		menu.each do |i|
   		aux = aux + i.terreno
		end
		return aux.round(2)
	end

	##
	# Calcula el impacto ambiental de los gases emitidos de una comida
	def impactoAmbientalGEI(menu)
		aux = 0
		menu.each do |i|
   		aux = aux + i.gei
		end
		return aux.round(2)
	end

end
