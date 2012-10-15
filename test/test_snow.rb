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

end
