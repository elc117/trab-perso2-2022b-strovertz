require 'json'

def read_data(file)
  data = JSON.parse(File.read(file))
  [data['names'], data['address'], data['cities'], data['states'], data['cpf']]
rescue StandardError => e
  puts "Erro ao ler arquivo #{file}: #{e}"
  abort
end

def save_person(person)
  File.open("json/person_data/person_#{person[:name].downcase}.json", 'w') do |file|
    file.write(person.to_json)
  end
rescue StandardError => e
  puts "Erro ao salvar pessoa #{person}: #{e}"
  abort
end

def read_wordlist(file)
  File.readlines(file).map(&:chomp)
rescue StandardError => e
  puts "Erro ao ler arquivo #{file}: #{e}"
  abort
end

def export_datafile(data)
  File.open('json/data/data.json', 'w') do |file|
    file.write(data.to_json)
  end
rescue StandardError => e
  puts "Erro ao salvar arquivo data.json: #{e}"
  abort
end

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


def main
  data = {
    names: read_wordlist('json/data/wordlists/names.txt'),
    address: read_wordlist('json/data/wordlists/address.txt'),
    cities: read_wordlist('json/data/wordlists/cities.txt'),
    states: read_wordlist('json/data/wordlists/states.txt'),
    cpf: read_wordlist('json/data/wordlists/cpf.txt')
  }
  export_datafile(data)
  open_datafile
end

main if __FILE__ == $0
