  @coin = 100
  @point = 0
    
  def display
    puts "残りのコイン数:#{@coin}"
    puts "ポイント数#{@point}"
    puts "--------------------------------------------"
    puts "何コイン入れますか？"
    puts "0(10コイン) 1(30コイン) 2(50コイン) 3(やめとく) "
    @button = gets.to_i
    @bets = [10,30,50]
  end
  
  display
  
  while true do 
    if @coin < @bets[@button]
        puts "#{@bets[@button] - @coin}コイン足りません"
        puts "またの御挑戦を！！"
        return false
        
    elsif @button == 3
        puts "またの機会に！"
        return false
        
    elsif (@button == 0) || (@button == 1) || (@button == 2)
        # スロットゲームの実装
        puts "エンターキーを三回押してください"
        
        puts "--------------------------------------------"
        slots = [1,2,3,4,5,6,7,8,9]
        enter = gets
        slot1 = rand(8) + 1
        slot2 = rand(8) + 1
        slot3 = rand(8) + 1
        
        puts "#{slots[slot1]}|"
        puts "#{slots[slot2]}|"
        puts "#{slots[slot3]}|"
        
        puts "--------------------------------------------"
        enter = gets
        slot4 = rand(8) + 1
        slot5 = rand(8) + 1
        slot6 = rand(8) + 1
        
        puts "#{slots[slot1]}|#{slots[slot4]}|"
        puts "#{slots[slot2]}|#{slots[slot5]}|"
        puts "#{slots[slot3]}|#{slots[slot6]}|"
        
        puts "--------------------------------------------"
        enter = gets
        slot7 = rand(8) + 1
        slot8 = rand(8) + 1
        slot9 = rand(8) + 1
        
        puts "#{slots[slot1]}|#{slots[slot4]}|#{slots[slot7]}|"
        puts "#{slots[slot2]}|#{slots[slot5]}|#{slots[slot8]}|"
        puts "#{slots[slot3]}|#{slots[slot6]}|#{slots[slot9]}|"
    else
        puts "正しく入力してください！"
        return false
    end
    # アタリの実装
    if (slot2 == 6) && (slot5 == 6) && (slot8 == 6)
      puts "--------------------------------------------"
      puts "#{@bets[@button] * 10}コインGET!!"
      puts "500ポイントGET!!"
      @coin = @coin + @bets[@button] * 10 - @bets[@button]
      @point = @point + 500
      display
    elsif (slot2 == slot5) && (slot5 == slot8)
      puts "--------------------------------------------"
      puts "真ん中が揃いました!!"
      puts "#{@bets[@button] * 5}コインGET!!"
      puts "200ポイントGET!!"
      @coin = @coin + @bets[@button] * 5 - @bets[@button]
      @point = @point + 200
      display
    else
      puts "--------------------------------------------"
      puts "残念！！もう一度トライしよう！！"
      @coin = @coin - @bets[@button]
      display
    end
  end