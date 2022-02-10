def frame_score(frame1, frame2, frame3)
  score = frame1[0] + frame1[1]

  if score == 10 # either spare or strike
    if frame1[0] != 10 # spare 
      score += frame2[0]
    else # strike
      score += frame2[0] + frame2[1]
    end 
  end

  score
end

def total_score(game)
  # game = [[3, 5], [6, 2], [3, 5], [7, 1], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5], [3, 5]]  # 40  total: 80
  sum = 0
  game.each_index do |index|
    frame1 = game[index]
    frame2 = game[index + 1]
    frame3 = game[index + 2]

    sum += frame_score(frame1, frame2, frame3)
  end
  sum
end


# 