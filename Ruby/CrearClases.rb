class Prueba
  attr_accessor:x #Hace la variable publica
  def initialize(x)
    @x = x
  end
  def Suma ()
    x + 1
  end
end

y  = 2
a = Prueba.new(y)
puts a.x
a.Suma
