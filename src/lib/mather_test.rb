require 'minitest/autorun'
require_relative 'mather'

add_results = [
  [0, 0, 0],
  [0, 1, 1],
  [1, 0, 1],
  [1, 1, 2],
  [-1, 1, 0],
  [1, -1, 0],
  [-1, -1, -2]
]

subtract_results = [
  [0, 0, 0],
  [1, 0, -1],
  [0, 1, 1],
  [-1, 0, 1],
  [-1, -1, 0],
  [1, -1, -2]
]

describe 'Mather' do
  it 'Adds' do
    matherLib = MatherLib.new
    add_results.each { |r| _(matherLib.add(r[0], r[1])).must_equal(r[2]) }
  end
  it 'Subtracts' do
    matherLib = MatherLib.new
    subtract_results.each do |r|
      _(matherLib.subtract(r[0], r[1])).must_equal(r[2])
    end
  end
end
