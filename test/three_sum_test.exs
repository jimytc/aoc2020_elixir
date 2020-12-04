defmodule ThreeSumTest do
  use ExUnit.Case

  test '[] with target 0 gets []' do
    assert ThreeSum.call([], 0) == []
  end

  test '[2,7,11,15] with target 24 gets [0, 1, 3]' do
    assert ThreeSum.call([2, 7, 11, 15], 24) == [0, 1, 3]
  end

  test '[3,2,4] with target 6 gets []' do
    assert ThreeSum.call([3, 2, 4], 6) == []
  end

  test '[2,3,1,9] with target 13 gets [1,2,3]' do
    assert ThreeSum.call([2, 3, 1, 9], 13) == [1, 2, 3]
  end
end
