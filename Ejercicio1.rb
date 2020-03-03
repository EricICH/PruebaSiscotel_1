
  #esta funcion valida que la entrada sea igual a "Ok"
  def validaOk (num)
    if num.downcase == 'ok'
      return false
    else
      return true
    end
  end

#definimos nuestro algoritmo como una funcion llamada 'programa'
def programa
  
  puts 'Ingresa un numero (escriba "Ok" para finalizar carga)'
  
  entrada = ''
  arreglo=[]
  
  #obtenemos entrada del usuario y validamos
  while validaOk(entrada)
    entrada = gets.chomp
    #validar si es entero antes de almacenar
    if entrada.to_i.to_s == entrada
      arreglo.push(entrada.to_i)
    else
      #validamos para descartar la palabra ok como error
      if validaOk(entrada)
        puts 'solo se permiten Numeros enteros (escriba "Ok" para finalizar)'
      end
    end
  end


  print 'Ingrese resultado a buscar: '
  resultado = gets.chomp.to_i

  # aca se recorre el arreglo obteniendo el valor del indice i
  #res = variable donde se guardaran cuantas coincidencias sean encotnradas
  res=0
  arreglo.each_with_index do |valor, i|
    
    #se obtiene el numero X que se desea buscar en el arreglo
     obj = resultado - valor
     
     #recorremos el arreglo desde el elemento i en adelante evitando comparaciones redundantes
     #obteniendo aca el valor j para indicar indice del segundo elemento en cuestion
     #al coincidir que arreglo[j] sea igual a obj obtenemos el resultado buscado
     #donde arreglo[i] + arreglo[j] sea igual a resultado, y continua en busqueda de mas coincidencias
     
     (i+1..arreglo.length).each do |j|   
       if arreglo[j]==obj
        res+=1
        e1=arreglo[i]
        e2=arreglo[j]
        print "#{e1} + "
        #en caso de ser negativo
        if(e2<0)
          print "(#{e2})"
        else
          print e2
        end 
        puts " = #{resultado} "
        puts "entrada 1: #{e1} posicion=> #{i}"
        puts "entrada 2: #{e2} posicion=> #{j}"
        puts ''
       end
     end
     
  end
  # en caso de no encontrar ninguna pareja de valores que coincida con el resultado
  if res==0 
   puts "No se encontraron coincidencas"
  end
end
  
  exe='s'
  #ciclo de ejecucion de programa
  while exe.downcase !='n'
    #verificar si se desea ejecutar el programa
    if exe.downcase == 's'
      #se ejecuta llamado a la funcion programa
      programa
    else
      #en caso de ingresar un valor diferente a 's' o 'n'
      puts "Comando no Valido"
    end
    puts "Desea repetir la Operacion (s/n): "
    exe=gets.chomp
  end
  puts "fin"
