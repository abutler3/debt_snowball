require 'yaml'

$age_hash = { }  # start with an empty hash

  def input
    print( "Please enter the debt name: " )
    d_name = gets().chomp()
    print( "Please enter the minimum monthly payment: " )
    d_pay = gets().chomp().to_i
    print( "Please enter the interest. If none, enter 0: " )
    d_interest = gets().chomp().to_i
    print( "Please enter the total balance: " )
    d_balance = gets().chomp().to_i
    $age_hash = {name: d_name, minimum: d_pay, interest: d_interest, total: d_balance}
  end

def saveDB
File.open('hash.yml', 'a'){ |f|
  YAML.dump($age_hash, f)
  }
end

def loadDB
  yp = File.open('hash.yml')
log = YAML::load_documents( yp ) { |doc|
  puts "#{doc[:name]}"
  puts "#{doc[:minimum]}"
  puts "#{doc[:total]}"
}
end

def rand
  a = ['a','b','z'].sample
end

#Start me up
ans = ''
until ans == 'q' do
  puts "Good morning, would you like to get rid of some debt?"
  puts
  puts "Add (D)ebt, Record (P)ayment, (L)ist All - (S)ave or (Q)uit?"
  puts
  puts "Press (K) for the letter of the moment!!!"
  print "> "
  ans = gets[0].downcase()
  case ans
  when 'd' then input
  when 'p' then puts "Payment made...."
  when 'l' then loadDB
  when 's' then saveDB
  when 'k' then puts "The letter of the moment is #{rand}. Stop stalling!!!"
  end
  puts( "Thanks, now cut up those credit cards!!!")
end
