Node = Struct.new(:value, :next, :prev)

##
# Clase Lista usada como una lista doblemente enlazada, incluye Enumerable
class List

include Enumerable

  attr_reader :head, :tail, :sz

  ##
  # Metodo que inicializa la lista a tamaño cero
  def initialize
    @sz = 0
  end

  ##
  # Introduce un valor en la lista
  def <<(val)
    node = Node.new(val)
    if(@head == nil)
      @head = node
      @tail = node
    else
      node.prev = @tail
      @tail.next = node
      @tail = node
    end
    @sz += 1
    self
  end

  ##
  # Elimina el ultimo dato de la lista
  def pop(n = 1)
    n.times do
      if(@tail != nil)
        @tail = @tail.prev
        @tail.next = nil
      end
    end
    @head = nil if @tail == nil
    @sz -= 1
  end

  ##
  # Elimina el primer dato de la lista
  def shift(n = 1)
    n.times do
      if @head != nil
        @head = @head.next
        @head.prev = nil
      end
    end
    @tail = nil if @head == nil
    @sz -= 1
  end

  ##
  # Recorre la lista
  def each
    node = @head
    while(node != nil)
      yield node.value
      node = node.next
    end
  end

  ##
  # Añade un dato al principio de la lista
  def unshift(val)
    node = Node.new(val)
    if(@head == nil)
      @head == node
      @tail == node
    else
      node.next = @head
      @head.prev = node
      @head = node
    end
    @sz += 1
  end

  ##
  # Inserta un valor en cualquier posicion de la lista
  def insert(pos, *arg)
    node = @head
    pos.times do
      if node != nil
        node = node.next
      end
    end
    if node == @head
      self.unshift arg[0]
    else
      arg.each do |item|
        if node == nil
          self << item
        else
          newNode = Node.new(item)
          newNode.prev = node.prev
          node.prev.next = newNode
          newNode.next = node
          node.prev = newNode
        end
      end
    end
    @sz += 1
  end

  ##
  # Calcula los gases diarios de toda la comida de la lista	
  def geiDiario()
	gei = 0
	nodeAux = @head
	while (nodeAux != nil)
		gei += nodeAux.value.gei
		nodeAux = nodeAux.next
	end
	return gei.round(2)
  end

  ##
  # Calcula los gases anuales de toda la comida de la lista
  def geiAnual()
	gei = 0
	nodeAux = @head
	while (nodeAux != nil)
		gei += nodeAux.value.gei
		nodeAux = nodeAux.next
	end
	return (gei * 365).round(2)
  end

  ##
  # Calcula el terreno anual de toda la comida de la lista
  def terrenoAnual()
	terreno = 0
	nodeAux = @head
	while (nodeAux != nil)
		terreno += nodeAux.value.terreno
		nodeAux = nodeAux.next
	end
	return terreno.round(2)
  end


end
