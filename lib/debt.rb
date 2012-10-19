require 'yaml'

$db = YAML::load( File.open ('bills.yml') )

class Debt
  attr_accessor :name, :balance, :payment, :apr

  def initialize
    @extra = $db["extra_each_month"]
    @once = $db["one_shot_extra"]
    @months_limit = $db["max_months"]
    @bill_list = $db["bills"]
    @original_bill_count = @bill_list.length
  end

  def extra
    p @extra
  end

  def showData
    puts $db.to_yaml
  end

  def one
    p @once
  end

  def showBills
    puts @bill_list
  end

  def max
    p @months_limit
  end

  def r(val)
    (val * 100).round / 100.0
  end

  def total_balance
    r(@bill_list.inject(0) {|i, b|
      i + b["balance"]
      })
  end

  def find_max_name
    max_name_length = @bill_list.inject(0) {|i, b| [i, b["name"].length].max }
  end

  def print_max_name
    name_format = "%-#{find_max_name}s"
  end

  def save_o
    original_balance = total_balance
  end

  def print_o
    puts sprintf("ORIGINAL BALANCE: %.2f", save_o)
    puts
  end

  def setup
            @extra_now = @extra + @once
            @once = 0
            @total_old_balance = total_balance
            @total_paid_this_month = 0
            @total_interest_this_month = 0
            bills_paid_off_this_month = 0
  end

  def apr
    m = 0
      while (m < 4)
        m +=1
        setup
        puts sprintf("Month %d: (extra=%.2f)", m, @extra_now)
        @bill_list.each do |bill|
          apr = bill["apr"]
          interest = r(bill["balance"] * (apr / 1200.0))
          puts interest
        end
      end
  end

  def old_balance
    m = 0
      while (m < 4)
        m += 1
        setup
        puts sprintf("Month %d: (extra=%.2f)", m, @extra_now)
        @bill_list.each do |bill|
          old_balance = bill["balance"]
          puts old_balance
        end
      end
  end

    def amount_to_pay
    m = 0
      while (m < 4)
        m += 1
        setup
        puts sprintf("Month %d: (extra=%.2f)", m, @extra_now)
        @bill_list.each do |bill|
          amount_to_pay = r(bill["payment"] + @extra_now)
          puts amount_to_pay
        end
      end
  end

  def new_balance
    m = 0
      while (m < 4)
        m += 1
        setup
        puts sprintf("Month %d: (extra=%.2f)", m, @extra_now)
        @bill_list.each do |bill|
            amount_to_pay = r(bill["payment"] + @extra_now)
            new_balance = bill["balance"] - amount_to_pay
            puts new_balance
        end
      end
  end

    def zero_balance_start
        new_balance = 0
    end

    def zero_balance_to_pay
        zero_balance_start
        amount_to_pay = 600
    end

    def zero_balance_extra_no
        extra_now = -(zero_balance_start)
    end

    def add_extra
      @extra += 150
    end

    def rounding1
      balance = 124454.3457
      amount_to_pay = 34055
      test_balance = r(balance - amount_to_pay)
    end

    def rounding2
      @total_paid_this_month = r(@total_paid_this_month + amount_to_pay)
    end

    def result_ex
      amount_to_pay = 2000
      old_balance = 7000
      interest = 1.2
      balance = 5000
      puts sprintf(print_max_name, bill["name"]) +
            sprintf("  Pay:%-7.2f Was:%-7.2f Int:%-7.2f Now:%-7.2f",
            amount_to_pay, old_balance, interest, balance)
    end

  def pay_off
    m = 0
      while (@bill_list.length > 0)
        m += 1
        setup
        puts sprintf("Month %d: (extra=%.2f)", m, @extra_now)
        @bill_list.clone.each do |bill|
          apr = bill["apr"]
          old_balance = bill["balance"]
          amount_to_pay = r(bill["payment"] + @extra_now)
          new_balance = bill["balance"] - amount_to_pay
          if new_balance < 0
            amount_to_pay = bill["balance"]
            @extra_now = -(new_balance)
            @extra += bill["payment"]
            new_balance = 0
            @bill_list.delete(bill)
          else
            @extra_now = 0
          end
          bill["balance"] = r(bill["balance"] - amount_to_pay)
          @total_paid_this_month = r(@total_paid_this_month + amount_to_pay)
          interest = r(bill["balance"] * (apr / 1200.0))
          @total_interest_this_month = r(@total_interest_this_month + interest)
          bill["balance"] = r(bill["balance"] + interest)
          puts sprintf(print_max_name, bill["name"]) +
            sprintf("  Pay:%-7.2f Was:%-7.2f Int:%-7.2f Now:%-7.2f",
            amount_to_pay, old_balance, interest, bill["balance"])
        end
        puts sprintf("#{print_max_name}  PAY:%-7.2f WAS:%-7.2f INT:%-7.2f NOW:%-7.2f", "MONTH TOTAL",
          @total_paid_this_month, @total_old_balance, @total_interest_this_month, total_balance)
        # if m >= @months_limit
        #   puts "(terminating run after #{m} months)"
        #   exit
        # end # End of if
      end

  end #End of method
end # End of class

ll = Debt.new
ll.pay_off
