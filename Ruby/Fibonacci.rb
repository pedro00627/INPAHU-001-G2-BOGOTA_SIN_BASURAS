#Funcion para crear la serie Fibonacci
def fibonacci()
  anterior = 0
  actual = 1
  resultado = 0
  var = 0

  while var < 5

    resultado = anterior + actual
    anterior = actual
    actual = resultado
    puts actual
    var += 1
  end
end
fibonacci()
