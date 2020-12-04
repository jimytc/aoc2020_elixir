defmodule TwoSumTest do
  use ExUnit.Case

  test '[] with target 0 gets []' do
    assert TwoSum.call([], 0) == []
  end

  test '[2,7,11,15] with target 9 gets [0, 1]' do
    assert TwoSum.call([2, 7, 11, 15], 9) == [0, 1]
  end

  test '[3,2,4] with target 6 gets [1,2]' do
    assert TwoSum.call([3, 2, 4], 6) == [1, 2]
  end

  test '[3,3] with target 6 gets [0,1]' do
    assert TwoSum.call([3, 3], 6) == [0, 1]
  end

  test '[3,3] with target 4 gets []' do
    assert TwoSum.call([3, 3], 4) == []
  end
end
