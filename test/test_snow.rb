require 'test/unit'
require 'debt'

class SnowTest < Test::Unit::TestCase


    def test_01_saving_debt_name
        ll = Debt.new
        assert_equal("Chase Bank", ll.initialize)
    end

end
