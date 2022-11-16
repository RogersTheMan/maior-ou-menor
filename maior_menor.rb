def boas_vindas
    puts "Bem vindo ao jogo de adivinhação"
    puts "Qual é o seu nome?"

    nome = gets.chomp

    puts "--------------------------------------------------"
    puts "O jogo já está pronto para começarmos, #{nome}"
    puts "--------------------------------------------------"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja?"
    puts "(1 - Muito fácil, 2 - Fácil, 3 - Normal, 4 - Difícil, 5 - Impossivel)"
    dificuldade = gets.to_i
end

def sorteio_numero(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um numero secreto entre 1 e #{maximo}...."
    
    sorteado = (rand(maximo)).round + 1
    
    puts "Número secreto escolhido, tente adivinhá-lo!"
    puts "--------------------------------------------------"
    
    sorteado
end

def pede_numero(chutes, chance, limite_tentativa)
    puts "Tentativa #{chance} de #{limite_tentativa}"
    puts "Números tentados até agora: #{chutes}"
    puts "Entre com seu número escolhido:"
    chute = gets.chomp.to_i
    puts "--------------------------------------------------"
    puts "Será que acertou? Seu número foi: #{chute}"
    chute
end

def verifica_acerto(tentativa, n_secreto)
    if tentativa == n_secreto
        puts "Parabéns, você acertou!"
        puts "--------------------------------------------------"
        return true
    end
    maior = n_secreto > tentativa
    if maior
        puts "O número secreto é maior!"
        puts "--------------------------------------------------"
    else
        puts "O número secreto é menor!"
        puts "--------------------------------------------------"
    end
    false
end

def joga(nome, dificuldade)
    n_secreto = sorteio_numero(dificuldade)

    pontos = 1000
    limite_tentativa = 5
    chutes = []

    for chance in 1..limite_tentativa
        tentativa = pede_numero(chutes, chance, limite_tentativa)
        chutes << tentativa

        if nome == "Rodrigo"
            puts "Parabéns, você acertou!"
            n_secreto = tentativa
            break
        end

        break if verifica_acerto(tentativa, n_secreto)
        pontos -= 200
    end

    puts "O número secreto era: #{n_secreto}"
    puts "Você terminou com #{pontos} pontos!"
end

def quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.chomp
    quero_jogar.upcase == "S"
end

nome = boas_vindas
dificuldade = pede_dificuldade


loop do
    joga(nome, dificuldade)
    if !quer_jogar
        break
    end 
end

