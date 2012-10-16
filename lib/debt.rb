require 'yaml'

$data = YAML::load( File.open ('bills.yml') )

class Debt
  attr_accessor :name, :balance, :payment, :apr

  def initialize
    @extra_each_month = $data["extra_each_month"]
    @one_shot = $data["one_shot_extra"]
    @max_months = $data["max_months"]
    @all_bills = $data["bills"]
    @original_bill_count = @all_bills.length
  end

  def extra
    p @extra_each_month
  end

  def showData
    puts $data.to_yaml
  end

  def one
    p @one_shot
  end

  def showBills
    puts @all_bills
  end

  def max
    p @max_months
  end

  def r(val)
    (val * 100).round / 100.0
  end

  def total_balance
    r(@all_bills.inject(0) {|i, b|
      i + b["balance"]
      })
  end

  def find_max_name
    max_name_length = @all_bills.inject(0) {|i, b| [i, b["name"].length].max }
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

  def pay_off
    m = 0
      while (@all_bills.length > 0)
        m += 1
        extra_now = @extra_each_month + @one_shot
        one_shot = 0
        total_old_balance = total_balance
        total_paid_this_month = 0
        total_interest_this_month = 0
        lowest_balance = nil
        lowest_balance_name = nil
        bills_paid_off_this_month = 0
        puts sprintf("Month %d: (extra=%.2f)", m, extra_now)
        @paid_off_bills.each do |paid_off_bill|
          puts sprintf("#{name_format}  Paid %d months ago", paid_off_bill.name, m - paid_off_bill.month_paid_off)
        end
      end
  end

end

