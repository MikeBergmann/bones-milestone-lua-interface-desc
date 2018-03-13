require "BonesMilestone"

_T = language.getlocal -- to get local text  

--[[ 
  'ACEY DUCEY' Card Game ported from BASIC to Lua by Jason Wraxall - byteclub.com.au
.. Adjusted for the Milestone plattform by Mike Bergmann
.. 
.. https://en.wikibooks.org/wiki/Lua_Programming/A_simple_card_game
]]

-- Wait on key press
function hit_key()
  local keys = {event.KEY_PLAY, event.KEY_MODE, event.KEY_REC, event.KEY_FF, event.KEY_REW, event.KEY_SEL }  
  local loop = true
  local ev
  event.clear()
  while loop do
    ev = event.pop()
    if ev ~= nil then
      for i, v in ipairs(keys) do
        if v == ev then
          loop = false
          break
        end    
      end    
    end
  end    
  return ev
end

function showIntro()
  local intro = { 
[[Acey Ducey Card Game
Acey-Ducey is played in the following manner:
The dealer (your Milestone) deals two cards face up and you have an option to bet or not bet depending
on whether or not you feel the card will have a value between the first two.
Your left or right buttons will increase or decrease your bet in 5$ steps. Play is setting the bet. If you press play without 
increasing you will pass. 
]]
, 
[[Acey Ducey.
Acey Ducey ist ein Kartenspiel. Der Croupier zieht zwei Karten und du hast die Möglichkeit Einsätze zu platzieren, 
je nachdem ob du der Meinung bist, dass die nächste Karte zwischen den bereits gezogenen liegt.  
Linke oder Rechte Pfeiltaste erhöht oder verringert den Einsatz um 5 Euro. Play setzt die Wette. Mit Play ohne Einsatz wird gepasst.
]]
  }

  print(_T(intro))

end

-- Initializes the 'Bank' and Random Number Generator
function initGame()
 bankBalance = 100 
 math.randomseed( os.time() )
end

-- Shows the Cards
function showCard(val)
  local cards={ nil, 2, 3, 4, 5, 6, 7, 8, 9, 10, _T({"Jack","Bube"}), _T({"Queen","Dame"}), _T({"King","König"}), _T({"Ace","Ass"})} 
  return cards[val]
end
    
-- Look into the purse
function adjustBalance( amount )
  bankBalance = bankBalance + amount
  print(_T({"You now have ","Du besitzt "})..bankBalance.._T({" Dollar."," Euro."}))
end  

-- Random card
function dealCard()
  local nextCardValue = math.random(2,14)
  return nextCardValue
end

-- Draw two cards
function dealCards()
  print(_T({"Here are the next two cards:","Hier die nächsten beiden Karten:"}))
  local cardValues = {first=dealCard(),second=dealCard()}
  print(_T({"First card: ", "Erste Karte: "}) .. showCard(cardValues.first) )
  print(_T({"Second card: ", "Zweite Karte: "}) .. showCard(cardValues.second) )  
  return cardValues
end

-- Bid
function getBet()

  betOK = false
  local betAmount = 0
  
  -- Loop to get a valid bet or a zero bet
  repeat
    print(_T({"What is your bet?","Wie viel bietest du?"}));
  
    local key
    while key ~= event.KEY_PLAY do
      key = hit_key()
      if key ~= event.KEY_PLAY then
        if key == event.KEY_FF then
          betAmount = betAmount + 5
        else
          betAmount = betAmount - 5
          if betAmount < 0 then
            betAmount = 0
          end
        end
        print(tostring(betAmount) .. _T({" Dollar"," Euro"}))
      end
    end
      https://en.wikibooks.org/wiki/Lua_Programming/A_simple_card_game
    if betAmount==0 then
      print(_T({"Chicken!","Feigling!"}))
      betOK = true      
    end
    
    if betAmount <= bankBalance then
      betOK = true
    else
      print(_T({"Sorry, my friend, but you bet too much.","Entschuldigung mein Freund, aber dein Gebot ist zu hoch."}))
      print(_T({"You have only ","Du hast nur noch "}) .. bankBalance .. _T({" Dollars to bet", " Euro."}))
    end
  until betOK    
  
  return betAmount
end

--Draws another card and compares the values
function playRound( cardValues )
  local playerCard = dealCard()
  local firstCard = cardValues.first 
  local secondCard = cardValues.second 

  print(_T({"Dealer Card ","Croupier zieht die Karte "}) .. showCard(playerCard) )  
  
  local minValue = math.min( firstCard, secondCard )
  local maxValue = math.max( firstCard, secondCard )
  
  if playerCard>=minValue and playerCard <=maxValue then
    print(_T({"You win!","Du gewinnst!"}))
    return true
  end
  
  print(_T({"You lose!","Du verlierst!"}))
  return false
end


function endGameReplay()  
  print(_T({"Sorry, friend, but you blew your wad.","Auf wiedersehen. Du bist nämlich Pleite."}))  
  return false
end

showIntro()
  
done = false

initGame()

-- Game Loop
repeat
    local cardValues = dealCards()
    local betAmount = getBet()
    
    if betAmount == 0 then
      done=true
    else
      if playRound(cardValues) then
        adjustBalance( betAmount )
      else
        adjustBalance( -betAmount )
      
        if bankBalance <= 0 then
          if endGameReplay()==true then
            initGame()
          end
          done=true
          end
      end
    end
  until done
  