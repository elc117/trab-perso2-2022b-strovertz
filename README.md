# Ruby Funcional: Criação de pessoas ficticias de forma randomica baseado em wordlists
![Miniatura thumbnail youtube click bait com foto roxo e verde](https://user-images.githubusercontent.com/74078237/215341011-df83ab68-f414-4448-85da-47374255706c.png)
## Descrição:


Para atender aos critérios propostos, desenvolvi uma aplicação em Ruby capaz de coletar dados de wordlists e gerar pessoas de forma randomica. Cada usuário é armazenando em um arquivo "chave : 'valor'", neste caso Json que é um formato utilizado para troca de dados simples entre sistemas.

## Ruby Funcional:
 A aplicação foi desenvolida utilizando técnica de programação funcional, como: 
  - Utilização de procedures
  - Expressões lambda
  - funções de primeira classe
  - Uso de funções como "map", "reduce" e "filter". 

### Procedures: 
Blocos de código (procedures) que são passados como argumentos para outras funções
### Lambda:
``` ruby
read_wordlist(file).map(&:chomp)
```
Aqui, a função map é usada para aplicar a operação chomp a cada elemento de uma lista de strings. O símbolo & permite que a expressão lambda seja passada como um argumento para a função map. A expressão lambda é uma forma de definir uma função de uma única linha sem a necessidade de dar-lhe um nome. A expressão :chomp é a forma abreviada de escrever { |s| s.chomp }. Ou seja, o símbolo & permite que o método chomp seja tratado como uma função, tornando possível sua passagem como argumento para a função map.

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

## A aplicação

Simply hit run! You can edit the run command from the `.replit` file.

## Installing packages

To add packages to your repl, we recommend using the Replit packager interface in the left sidebar or using `bundle install` in the shell. Check out the [Bundle docs here](https://bundler.io/v2.3/#getting-started).

**Warning: Avoid using `gem install` to add packages.**

Beacuse Ruby repls use [Bundle](https://bundler.io/) under the hood to provide a consistent environment that tracks and installs the exact gems and versions needed, we recommend using `bundle install` instead of `gem install`, which may not work as expected.

## Help

If you need help you might be able to find an answer on our [docs](https://docs.replit.com) page. Feel free to report bugs and give us feedback [here](https://replit.com/support).
