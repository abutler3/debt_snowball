require 'test/unit'
require 'debt'

class SnowTest < Test::Unit::TestCase


    def test_01_getting_extra
        ll = Debt.new
        assert_equal(40, ll.extra)
    end

    def test_02_print_info
        ll = Debt.new
        assert_equal(nil, ll.showData)
    end

    def test_03_print_one
        ll = Debt.new
        assert_equal(150, ll.one)
    end

    def test_04_print_bills
        ll = Debt.new
        assert_equal(nil, ll.showBills)
    end

    def test_05_max_number
        ll = Debt.new
        assert_equal(6, ll.max)
    end

    def test_06_compute_r
        ll = Debt.new
        assert_equal(9175, ll.r(9175))
    end

    def test_07_find_total_balance
        ll = Debt.new
        assert_equal(9175.0, ll.total_balance)
    end

    def test_08_find_max_length
        ll = Debt.new
        assert_equal(12, ll.find_max_name)
    end

    def test_09_print_max_name_length
        ll = Debt.new
        assert_equal(12, ll.print_max_name)
    end

    def test_10_find_original_stuff_1
        ll = Debt.new
        assert_equal(9175.0, ll.save_o)
    end

    def test_11_save_originial_balance
        ll = Debt.new
        assert_equal(6, ll.save_o)
    end

    def test_12_print_originial_balance
        ll = Debt.new
        assert_equal(nil, ll.print_o)
    end

    def test_13_print_month_listing
        ll = Debt.new
        assert_equal(0, ll.pay_off)
    end

    def test_14_get_apr_rate
        ll = Debt.new
        assert_equal(1.88, ll.apr)
    end

    def test_15_print_old_balance
        ll = Debt.new
        assert_equal(nil, ll.old_balance)
    end

    def test_16_print_month_payment
        ll = Debt.new
        assert_equal(nil, ll.amount_to_pay)
    end

    def test_18_print_new_balance
        ll = Debt.new
        assert_equal(nil, ll.new_balance)
    end

    def test_19_zero_balance_start
        ll = Debt.new
        assert_equal(nil, ll.zero_balance_start)
    end

    def test_20_zero_balance_to_pay
        ll = Debt.new
        assert_equal(23, ll.zero_balance_to_pay)
    end

    def test_21_zero_balance_extra_no
        ll = Debt.new
        assert_equal(600, ll.zero_balance_extra_no)
    end

    def test_22_zero_balance
        ll = Debt.new
        assert_equal(600, ll.zero_balance_to_pay)
    end
end
