require 'yaml'

$debt_arr = Array.new

$fn = 'debt_db.yml'


class DebtList

    def initialize
        @name          = "Visa"
        @minimum       = 50
        @interest      = 0
        @total         = 2000
        # @name          = arr[0]
        # @minimum       = arr[1]
        # @interest      = arr[2]
        # @total         = arr[3]
    end

    def getdetails
        return[@name, @minimum, @interest, @total]
    end

    def newDebt

  d_name = "Visa"
  d_pay = 20
  d_interest = 0
  d_balance = 2000
  # print( "Please enter the debt name: " )
  # d_name = gets().chomp()
  # print( "Please enter the minimum monthly payment: " )
  # d_pay = gets().chomp().to_i
  # print( "Please enter the interest. If none, enter 0: " )
  # d_interest = gets().chomp().to_i
  # print( "Please enter the total balance: " )
  # d_balance = gets().chomp().to_i
  return [d_name, d_pay, d_interest, d_balance ]
end

end

# def newDebt

#   d_name = "Visa"
#   d_pay = 20
#   d_interest = 0
#   d_balance = 2000
#   # print( "Please enter the debt name: " )
#   # d_name = gets().chomp()
#   # print( "Please enter the minimum monthly payment: " )
#   # d_pay = gets().chomp().to_i
#   # print( "Please enter the interest. If none, enter 0: " )
#   # d_interest = gets().chomp().to_i
#   # print( "Please enter the total balance: " )
#   # d_balance = gets().chomp().to_i
#   return [d_name, d_pay, d_interest, d_balance ]
# end


def addDebt( add )
    $debt_arr << add
end

def saveDB
    File.open( $fn, 'w' ) {
        |f|
        f.write($debt_arr.to_yaml)
    }
end

def loadDB
    input_data = File.read( $fn )
    $debt_arr = YAML::load( input_data )
end

def showData
    puts( $debt_arr.to_yaml )
end


# ans = ''
# until ans == 'q' do
#   puts( "Add (D)ebt, (P)ayment CD, (L)ist All - (S)ave or (Q)uit?" )
#   print( "> " )
#   ans = gets[0].downcase()
#   case ans
#   when 'd' then addDebt( DebtList.new( newDebt() ) )
#   when 'p' then puts "Payment made...."
#   when 'l' then puts "Listing..."
#   when 's' then saveDB
#   end
#   showData
# end
