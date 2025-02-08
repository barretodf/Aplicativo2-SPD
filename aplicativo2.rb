class Produtos
    def initialize(nome, preco, quantidade)
      @nome = nome
      @preco = preco
      @quantidade = quantidade
    end
  
    def calcular_total
      @preco * @quantidade
    end
  
    def detalhes
      "Nome do produto: #{@nome}, Valor total: #{formatar_valor(calcular_total)}"
    end
  
    private
  
    def formatar_valor(valor)
      partes = format('%.2f', valor).split('.')
      partes[0] = partes[0].reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
      partes.join(',')
    end
  end
  
  puts "Digite o nome:"
  nome = gets.chomp.to_s
  
  puts "Digite o preço:"
  preco = gets.chomp.to_f
  
  puts "Digite a quantidade:"
  quantidade = gets.chomp.to_i
  
  # Criando o produto
  produto = Produtos.new(nome, preco, quantidade)
  
  # Mostrando o resultado formatado
  puts "O valor total de #{nome} em estoque é: R$#{produto.send(:formatar_valor, produto.calcular_total)}"
  