require 'minitest/autorun'
require_relative '../lib/word_synth'
require_relative '../lib/effects'

class WordSynthTest < Minitest::Test
  def test_play
    assert WordSynth
    assert Effects
  end
end
