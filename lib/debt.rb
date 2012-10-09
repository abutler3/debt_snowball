class Debt

  def initalize
    @balance = balance
    @payment = payment
    @name = name
    @interest = interest
  end

  def label
    puts "Please enter the debt name..."
    @name = gets.chomp
  end

  def payment
    puts "Please enter the minimum monthly payment..."
    @amount = gets.chomp
  end

  def balance
    puts "Please enter the total balance"
    @balance = gets.chomp
  end

  def interest
    puts "Please input the interest rate (no % sign)"
    @interest = gets.chomp
  end

  def create
    header = puts "Name" + '   ' + "Minimum" + '   ' + "Balance" + '   ' + "Interest"
    puts header
    puts @name. + '  ' + @amount + '   ' + @balance + '   ' + @interest
  end

  def record
    balance
    payment
    @balance = balance.to_i - payment.to_i
    @balance
  end

end
ll = Debt.new
ll.label
ll.payment
ll.balance
ll.interest
ll.create
