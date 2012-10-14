require 'yaml'

class Debt
  attr_accessor :name, :balance, :payment, :apr

  def initalize
    @data = YAML.load_file("bills.yaml")
    @extra_each_month = data["extra_each_month"]
    @one_shot = data["one_shot_extra"]
    @max_months = data["max_months"]
    @all_bills = data["bills"]
    puts @data
  end

end

