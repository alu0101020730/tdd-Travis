class MenuDSL 

	def initialize(name, &block)
	    @name = name
	    @desc_menus = []
	    @menu = []
	    @precio = []

	    if block_given?  
	      if block.arity == 1
		yield self
	      else
	       instance_eval(&block) 
	      end
	    end
	end

	def componente(bloque = {})
		@desc_menus << bloque[:descripcion]
		@menu << bloque[:platos]
		@precio << bloque[:precio]
	end


	def to_s
		text = @name + "\n"
		for i in 0..@desc_menus.length-1 do
			text << "- #{@desc_menus[i]} | Tot.Prot: #{@menu[i].totalProteina}, Tot.Lipidos: #{@menu[i].totalLipidos}, Tot.CarbHidr: #{@menu[i].totalHidratos}, Tot.GEI: #{@menu[i].geiTotal}, Tot.Terreno: #{@menu[i].terrenoTotal}, Tot.Gramos: #{@menu[i].totalGramos}\n"
			text << "#{@menu[i]}"
			text << "#{@precio[i]} €\n"
		end

		text
	end


end
