##
# Clase que contiene la informacion nutricional de los alimentos, incluye Comparable
class Alimentos 

include Comparable

	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :gramos
	
	##
	# Metodo inicializacion que se encarga de crear el objeto alimento y dar valores
	# a los atributos
	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno, gramos)
		@nombre, @proteinas, @carbohidratos, @lipidos, @gei, @terreno, @gramos =
		nombre, proteinas, carbohidratos, lipidos, gei, terreno, gramos 
	end

	##
	# Definicion metodo to_s, devuelve el nombre del alimento
	def to_s 
		str = String.new
		str << @nombre
	end
		
	##
	# Condicion de comparacion entre varios alimentos
	def <=> otro
		(@gei + @terreno) <=> (otro.gei + otro.terreno)  	  			
  	end
end

##
# Clase hija de alimentos que contiene la eficiencia del alimento, incluye Comparable
class EfEnergetica < Alimentos

	attr_reader :eficiencia
	
	##
	# Contstructor encargado de dar los valores a los atributos
	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno, eficiencia)
		super(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@eficiencia = eficiencia
	end 
	
	

end
