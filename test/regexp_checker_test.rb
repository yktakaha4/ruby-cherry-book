require 'minitest/autorun'
require_relative '../lib/regexp_checker'

class RegexpCheckerTest < Minitest::Test
  def setup
    $stdin = StringIO.new
    $stdout = StringIO.new
  end

  def teardown
    $stdin = STDIN
    $stdout = STDOUT
  end

  def test_regexp_checker
    $stdin.string = "foobar\nfoo\n"
    $stdout = StringIO.new
    regexp_checker
    assert_equal "Text?: Pattern?: Matched: foo\n", $stdout.string
  end

  def test_regexp_checker_invalid_pattern
    $stdin.string = "foobar\n[\nfoo\n"
    $stdout = StringIO.new
    regexp_checker
    assert_includes $stdout.string, "Invalid pattern:"
  end
end
