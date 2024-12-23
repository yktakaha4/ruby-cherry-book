require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def test_gate
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)

    ticket = Ticket.new(160)
    umeda.enter(ticket)
    assert juso.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_ehough
    umeda = Gate.new(:umeda)
    mikuni = Gate.new(:mikuni)

    ticket = Ticket.new(160)
    umeda.enter(ticket)
    refute mikuni.exit(ticket)
  end
end
