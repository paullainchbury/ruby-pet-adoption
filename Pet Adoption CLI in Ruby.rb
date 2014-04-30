require 'pry-byebug'

class Shelter
  attr_accessor :clients, :animals

  def initialize (clients={}, animals={})
    @clients = clients
    @animals = animals
  end

  def add_a_client(client)
    self.clients[client.name] = client
  end

  def add_an_animal(animal)
    self.animals[animal.name] = animal
  end

  def list_all_the_available_animals
   puts "\n\nA list of AVAILABLE animals: \n\n"
   puts "--------------------------------------------------------------------------"
   puts "NAME\t\tBREED\t\tAGE\tSEX\tAVAILABLE?\tFAVE TOY"
   puts "--------------------------------------------------------------------------" 
   self.animals.select {|k, v| v.is_available?}.each{|k, v| print v.name; print "\t\t"; print v.breed; print "\t"; print v.age; print "\t"; print v.gender; print "\t"; print v.is_available?; print "\t\t"; print v.favourite_toy; puts "\n"
   }
  end

  def list_all_the_animals
   puts "\n\nA list of ALL animals: \n\n"
   puts "--------------------------------------------------------------------------"
   puts "NAME\t\tBREED\t\tAGE\tSEX\tAVAILABLE?\tFAVE TOY"
   puts "--------------------------------------------------------------------------" 
   self.animals.each {|k, v| print v.name; print "\t\t"; print v.breed; print "\t"; print v.age; print "\t"; print v.gender; print "\t"; print v.is_available?; print "\t\t"; print v.favourite_toy; puts "\n"
   }

  end

  def adopt_an_animal(client_name, animal_name)
    # Put the animal object in the client's pets hash.
    puts @clients[client_name].pets = @animals[animal_name]

  end

  def list_the_clients
    puts "\n\nA list of our clients: \n\n"
   puts "--------------------------------------------------------------------------"
   puts "NAME\t\tAGE\t\tSEX\tNo OF KIDS\tPETS\t"
   puts "--------------------------------------------------------------------------" 
   self.clients.each {|k, v| print v.name; print "\t\t"; print v.age; print "\t\t"; print v.gender; print "\t"; print v.no_of_kids; print "\t\t"; print v.pets;"\n"
   }
  end



end


class Client
  attr_accessor :name, :age, :gender, :no_of_kids, :pets, :animals

  def initialize (name, age, gender, no_of_kids, pets={}, animals={})
    @name = name
    @age = age
    @gender = gender
    @no_of_kids = no_of_kids
    @pets = pets
    @animals = animals
  end


  def house_a_pet
  end

end


class Animal
  attr_accessor :name, :breed, :age, :gender, :available, :favourite_toy

  def initialize (name, breed, age, gender, available, favourite_toy='none')
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @available = available
    @favourite_toy = favourite_toy

  end

  def is_available?()
    if self.available == 'f'
      return false
    elsif self.available == 't'
      return true
    end
  end

end

def menu
  puts "\n\n************** HAPPITAILS ***************"
  puts "\nWhat would you like to do?"
  puts "(1) Add a client"
  puts "(2) View ALL animals"
  puts "(3) View AVAILABLE animals"
  puts "(4) Give up an animal for adoption"
  puts "(5) View all clients"
  puts "(6) Adopt an animal"
  puts "(q)uit\n\n"
  gets.chomp.downcase
end

happitails = Shelter.new
rover = Animal.new('Rover', 'Alsatian', 12, 'm', 't')
fido = Animal.new('Fido', 'Labrador', 3, 'm', 'f')
happitails.add_an_animal(rover)
happitails.add_an_animal(fido)
c1 = Client.new('Paul', 34, 'm', 0, 'f')
happitails.add_a_client(c1)
puts `clear`
response = menu
 
while response != 'q'
  case response
  when '1'
    print "Name: "; name = gets.chomp
    print "Your age: "; age = gets.chomp
    print "Your gender: "; gender = gets.chomp
    print "No. of children: "; no_of_kids = gets.chomp
    print "Do you have any pets? (t) or (f)? "; pets = gets.chomp
    c = Client.new(name, age, gender, no_of_kids, pets)
    happitails.add_a_client(c)
  when '2'
    happitails.list_all_the_animals
  when '3'
    happitails.list_all_the_available_animals
  when '4' 
  # name, breed, age, gender, available, favourite_toy='none'
    print "Animal's Name: "; name = gets.chomp
    print "Breed: "; breed = gets.chomp
    print "Age: "; age = gets.chomp
    print "Gender: "; gender = gets.chomp
    print "Favourite toy? "; favourite_toy = gets.chomp
    if favourite_toy == ("" || nil)
      favourite_toy = 'none'
    end
    a = Animal.new(name, breed, age, gender, 't', favourite_toy)
    happitails.add_an_animal(a)
    print "\nSUCCESS: We've put #{name} up for adoption."
  when '5'
    happitails.list_the_clients
  when '6'
    puts "\n\nWhich animal would you like to adopt?"
    happitails.list_all_the_available_animals
    print "\n\nEnter the name of animal: "; animal_name = gets.chomp
    puts "\n\nWho is going to adopt #{animal_name}? Choose from the list of clients."
    happitails.list_the_clients
    print "\n\nEnter the name of the client: "; client_name = gets.chomp
    happitails.adopt_an_animal(client_name, animal_name)
  end
  response = menu
end


  # while response != 'q'
  #   case response
  #   when '1'
  #     # name, age, gender, no_of_kids, pets='none', animals={})
  #     print "Name: "; name = gets.chomp
  #     print "Your age: "; age = gets.chomp
  #     print "Your gender: "; gender = gets.chomp
  #     print "No. of children: "; no_of_kids = gets.chomp
  #     print "Do you have any pets? (t) or (f)? "; pets = gets.chomp
  #     c = Client.new(name, age, gender, no_of_kids, pets)
  #     happitails.add_a_client(c)
  #     break
  #   when '2'
  #      happitails.list_all_the_animals
  #     break
  #   when '3'
  #     happitails.list_all_the_available_animals
  #     get_response
  #   when '4'
  #   else
  #     puts "Sorry, try again"
  #     get_response
  #   end
  # end










# binding.pry


# Add a client
# List all animals
# List available animals
# List all the clients (This is why you need a shelter class)
# Give up animal for adoption



# method to house a pet
# method to receive a new pet
# method to show all animals
# method to show all clients

