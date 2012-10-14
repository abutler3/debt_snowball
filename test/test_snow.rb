require 'test/unit'
require 'debt'

class SnowTest < Test::Unit::TestCase


    def test_01_saving_debt_name
        ll = Debt.new
        assert_equal("Chase Bank", ll.initialize)
    end

   #  def test_02_saving_debt_payment
   #      ll = DebtList.new
   #      assert_equal(200, ll.newDebt[1])
   #  end

   #  def test_03_saving_name_of_debt_balance
   #      ll = DebtList.new
   #      assert_equal(2000,  ll.newDebt[3])
   #  end

   #  def test_04_saving_interest
   #      ll = DebtList.new
   #      assert_equal(0,  ll.newDebt[2])
   #  end

   #  def test_05_column_header
   #      ll = Debt.new
   #      assert_equal(nil, ll.create)
   #  end

   #  def test_06_subtract_payment_and_create_new_total
   #      ll = Debt.new
   #     assert_equal(1800, ll.record)
   #  end

   #  def test_07_saving_debt_info
   #      ll = Debt.new
   #     assert_equal(1800, ll.record)
   #  end

   #  def test_08_saving_second_debt_entry_to_array
   #      ll = Debt.new
   #     assert_equal(1800, ll.record)
   #  end

   #  def test_09_total_debt_for_two_entries
   #      ll = Debt.new
   #     assert_equal(1800, ll.record)
   # end
end
