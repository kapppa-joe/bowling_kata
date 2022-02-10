require "bowling"

describe "bowling score of 1 frame" do
  it "if the first frame knocks down 0 pins, scores 0" do
    expect(frame_score([0, 0], [1, 0], [0, 0])).to eql 0
  end

  it "if the first roll knocks down 1 pin, scores 1" do
    expect(frame_score([1, 0], [1, 0], [0, 0])).to eql 1
  end

  it "if frame is not a strike or a spare, return the sum of the 2 rolls" do
    expect(frame_score([2, 5], [1, 0], [0, 0])).to eql 7
    expect(frame_score([3, 3], [1, 0], [0, 0])).to eql 6
  end

  it "if frame is a spare, return the sum of the 2 rolls plus the next roll" do
    expect(frame_score([5, 5], [1, 0], [0, 0])).to eql 11
  end

  it "if frame is a strike, return the sum of the 2 rolls plus the next two rolls" do
    expect(frame_score([10, 0], [1, 1], [0, 0])).to eql 12
  end
end

describe "bowling score of whole game" do
  it "calculate the total score if no strike and no spare" do
    whole_game = [[3, 5], [6, 2], [3, 5], [7, 1], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5]]  # 40  total: 80
    expect(total_score(whole_game)).to eql 80
  end

  it "calculate the total score if there is a spare" do
    whole_game = [[5, 5], [6, 2], [3, 5], [7, 1], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5]]  # 40  total: 80
    expect(total_score(whole_game)).to eql 88 # 80 + 2 + 6
  end
end
