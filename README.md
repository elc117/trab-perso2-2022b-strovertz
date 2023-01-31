# Aplicação de Ruby funcional para a criação de pessoas ficticias pseudo-randomicas baseadas em wordlists
![Miniatura thumbnail youtube click bait com foto roxo e verde](https://user-images.githubusercontent.com/74078237/215341011-df83ab68-f414-4448-85da-47374255706c.png)
## Descrição:


Para atender aos critérios propostos, desenvolvi uma aplicação em Ruby capaz de coletar dados de wordlists e gerar pessoas de forma randomica. Cada usuário é armazenando em um arquivo "chave : 'valor'", neste caso Json que é um formato utilizado para troca de dados simples entre sistemas.

# Ruby Funcional:
![image](https://user-images.githubusercontent.com/74078237/215767385-f217ac81-0efe-49da-91bf-af4319f4344f.png)

 A aplicação foi desenvolida utilizando técnica de programação funcional, como: 
  - Utilização de procedures
  - Expressões lambda 
  - funções de primeira classe
  - Uso de funções como "map", "reduce" e "filter". 

### Procedures: 
Blocos de código (procedures) que são passados como argumentos para outras funções
### Proc:
``` ruby
read_wordlist(file).map(&:chomp)
```
Aqui, a função map é usada para aplicar a operação chomp a cada elemento de uma lista de strings. O símbolo & permite que a expressão proc seja passada como um argumento para a função map.  A expressão :chomp é a forma abreviada de escrever { |s| s.chomp }. Ou seja, o símbolo & permite que o método chomp seja tratado como uma função, tornando possível sua passagem como argumento para a função map.
## Lambda
```ruby
def open_datafile
  names, address, cities, states, cpf = read_data('json/data/data.json')
  people = (1..100).map do
    {
      name: names.sample,
      address: "#{address.sample} #{rand(100)} #{cities.sample}, #{states.sample} #{rand(10_000)}",
      email: "#{names.sample.downcase}_#{rand(1000)}@example.com",
      phone: "+55-#{rand(50_000)}_#{rand(10_000)}",
      cpf: cpf.sample
    }
  end
  
  people.each do |person| 
    person_transformed = -> (person) { person[:name] = person[:name].upcase; person }.call(person)
    save_person(person_transformed)
  end
end
```
Nesse exemplo, a lambda -> (person) { person[:name] = person[:name].upcase; person } é passada como um bloco para o método call, transformando o nome da pessoa em maiúsculas antes de salvá-la.
Expressões lambda são uma forma de definir uma função de uma única linha sem a necessidade de dar-lhe um nome.

### Funções de primeira classe:

Utilizamos o techo de código do exemplo anterior para demonstrarmos a aplicação de funções de primeira ordem neste programa. 
A função "map" é usada para aplicar a expressão lambda chomp a cada elemento da lista de strings. Chomp é passado como argumento para a funão map com o simbolo &. Neste caso como citado na seção Lambda, chomp é tratado como uma função e pode ser passado como argumento para outras funções. Simplificando: Funções de primeira classe são utilizadas nos códigos quando são passadas como argumento para outras funções.
 
### Aplicação de Map
```Ruby
people = (1..100).map do
    {
      name: names.sample,
      address: "#{address.sample} #{rand(100)} #{cities.sample}, #{states.sample} #{rand(10_000)}",
      email: "#{names.sample.downcase}_#{rand(1000)}@example.com",
      phone: "+55-#{rand(50_000)}_#{rand(10_000)}",
      cpf: cpf.sample
    }
  end
  people.each { |person| save_person(person) }
end
```

Esta função tem o mesmo comportamento de quando são aplicadas em Haskell. Map aplica determinada operação para cada um dos elementos da lista, resultando em uma nova lista com o resultado da execução.

# A aplicação
Estrutura:
- Wordlists
- Data.json
- Person-VarName.json

Os dados para a criação das pessoas são coletados de wordlists encontradas em repositórios do GitHub, os números de CPF foram gerados utilizando o site https://ogeradordecpf.com.br/ que aplicao algoritmo necessário para gerar CPFs de acordo com o padrão estipulado pelas normas brasileiras. Em seguida todos os dados coletados são centralizados em um único arquivo chamado Data.json, este arquivo é utilizado para ter um controle de quais dados foram acessados e distribuidos pela ferramenta. Ao final, de forma pseudo aleatória os dados são distribuidos em novos dicionários e estes são salvos cada um em um arquivo com a sintaxe: person_NOME.json.

Explicando as funções: 
- read_data
- save_person
- read_wordlist
- export_datafile
- open_datafile
- main




## Exemplos de saída: 
### Wordlists
![image](https://user-images.githubusercontent.com/74078237/215344436-7b1b13c0-ea39-4fcd-a44f-e491b3acbd36.png)

### data.json
![image](https://user-images.githubusercontent.com/74078237/215344420-22d9a7c2-47e1-418f-9e2a-320e08134290.png)

### Person_NAME.json
![image](https://user-images.githubusercontent.com/74078237/215344469-5a81ace4-f704-4063-acb1-9d06460822d5.png)

# Como rodar o código?

Basta acessar o link disponibilizado abaixo, abrir o shell do replit e selecionar o botão verde "Run": 

## Repositório Repl.it
https://replit.com/@Gleison-Antonio/Ruby-302#main.rb

# Curiosidades
![image](https://user-images.githubusercontent.com/74078237/215772897-d4757552-500d-4f42-9ab2-e62137a940a2.png)

- Em Ruby, você pode escrever funções curtas e engraçadas como este "cumprimento_aleatorio" que retorna saudações aleatórias:
```ruby
def cumprimento_aleatorio
  [ "Olá!", "Oi!", "E aí!", "Como você está?"].sample
end
puts cumprimento_aleatorio
```
- O Ruby permite o uso de "procs" que são blocos de código que podem ser passados como argumentos para outras funções:
```ruby
saudacoes = [ "Olá!", "Oi!", "E aí!", "Como você está?" ]
cumprimento = Proc.new do
  saudacoes.sample
end

puts cumprimento.call
```
- Alguns exemplos de aplicações construídas com Ruby funcional incluem:<br>
 Análise de dados com ferramentas como o Pandas<br>
 Processamento de texto com a biblioteca de processamento de linguagem natural NLP<br>
 Desenvolvimento de jogos com a biblioteca Gosu.<br>
 - O GitHub, Airbnb, Twitch e SoundCloud foram feitos em Ruby!

## Installing packages

To add packages to your repl, we recommend using the Replit packager interface in the left sidebar or using `bundle install` in the shell. Check out the [Bundle docs here](https://bundler.io/v2.3/#getting-started).

**Warning: Avoid using `gem install` to add packages.**

Beacuse Ruby repls use [Bundle](https://bundler.io/) under the hood to provide a consistent environment that tracks and installs the exact gems and versions needed, we recommend using `bundle install` instead of `gem install`, which may not work as expected.

## Referências
[1] [Ruby Guide](https://www.rubyguides.com/) <br>
[2] [Ruby Docs](https://ruby-doc.org/) <br>
[3] [Programação Funcional em Ruby](https://speakerdeck.com/serradura/programacao-funcional-em-ruby-rubyconf-brasil-2018) <br>
[4] [Conceitos de Programação Funcional em Ruby](https://brizeno.wordpress.com/2013/12/06/conceitos-na-pratica-programacao-funcional-com-ruby/) <br>
[5] [Ruby Lang](https://www.ruby-lang.org/pt/about/)

