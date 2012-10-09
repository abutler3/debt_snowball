require 'test/unit'
require 'debt'

class SnowTest < Test::Unit::TestCase


    def test_01_saving_debt_name
        ll = Debt.new
        assert_equal("Chase Bank", ll.label)
    end

    def test_02_saving_debt_payment
        ll = Debt.new
        assert_equal(200, ll.payment)
    end

    def test_03_saving_name_of_debt_balance
        ll = Debt.new
        assert_equal(2000,  ll.balance)
    end

    def test_04_saving_interest
        ll = Debt.new
        assert_equal(0,  ll.interest)
    end

    def test_05_column_header
        ll = Debt.new
        assert_equal(nil, ll.create)
    end

    def test_06_subtract_payment_and_create_new_total
        ll = Debt.new
       assert_equal(1800, ll.record)
    end

    def test_07_saving_debt_info
        ll = Debt.new
       assert_equal(1800, ll.record)
    end

    def test_08_saving_second_debt_entry_to_array
        ll = Debt.new
       assert_equal(1800, ll.record)
    end
end
