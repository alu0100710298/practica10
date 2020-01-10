# Nodo, contiene un valor, el nodo siguiente y el nodo previo
# @attr value: Valor del nodo
# @attr next: Nodo siguiente
# @attr prev: Nodo anterior
Node = Struct.new(:value, :next, :prev)

# Clase lista, lista doblemente enlazada 
# @author Sergio Moreno Martín
# @attr_reader head: Devuelve el nodo cabeza de la lista
# @attr_reader tail: Devuelve el nodo cola de la lista

class Lista

    attr_reader :head, :tail
    include Enumerable

    # Constructor, requiere la cabeza y la cola de la lista
    def initialize(val)
        @head = Node.new(val,nil,nil)
        @tail = @head
    end

    # Comprueba si la lista está vacía
    def is_empty
        if(@head == nil) && (@tail == nil)
            return true
        else
            return false
        end
    end

    # Inserta un nodo por la cabeza de la lista
    def insert_head(val)
        aux = Node.new(val,@head,nil)
        @head.prev = aux
        @head = aux
    end

    # Inserta un nodo por la cola de la lista
    def insert_tail(val)
        aux = Node.new(val,nil,@tail)
        @tail.next = aux
        @tail = aux
    end

    # Extraer el nodo situado en la cabeza de la lista
    def extract_head
        aux = @head.value
        @head = @head.next
        @head.prev = nil
        return aux
    end

    # Extrae el nodo situado en la cola de la lista
    def extract_tail
        aux = @tail.value
        @tail = @tail.prev
        @tail.next = nil
        return aux
    end

    # Salida formateado como string de todos los elementos de la lista
    def to_s 
        current = @head
        string = "[ "
        while current != nil
            if(current.next == nil)
                string += "#{current.value}"
            else
                string += "#{current.value}, "
            end
            current = current.next
        end
        return string += " ]"
    end

    # Cálculo de la emisión de gases de efecto invernadero diarios
    def gei_diario
        aux = 0
        current = @head
        while current != nil
            aux += current.value.gei
            current = current.next
        end
        return aux
    end

    # Cálculo del uso del terreno
    def uso_terreno
        aux = 0
        current = @head
        while current != nil
            aux += current.value.terreno
            current = current.next
        end
        return aux
    end
    
    # Metodo each, es un metodo que sirve para iterar por todos los elementos de la lista, es necesario para el funcionamiento de los mixins de Enumerable
    def each
        actual = @head
        while actual != nil do
            yield actual.value
            actual = actual.next
        end
    end
end