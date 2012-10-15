require 'yaml'

$data = YAML::load( File.open ('bills.yml') )

class Debt
  attr_accessor :name, :balance, :payment, :apr

  def initialize
    @extra_each_month = $data["extra_each_month"]
    @one_shot = $data["one_shot_extra"]
    @max_months = $data["max_months"]
    @all_bills = $data["bills"]
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

end

