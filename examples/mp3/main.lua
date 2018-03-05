--[[
  Bones Milestone example for playing an MP3 File.
  This example makes use of:
    audio, for playing, pausing and stopping
    event, for the end of the MP3 file and key presses
    timer, for waiting
]]
 
require "BonesMilestone" -- allways necessary 
 
-- Get resource path
local respath = Milestone.respath()
 
--[[
  returns seconds as hh:mm:ss
]]
function secondstoclock(iseconds)
  local seconds = tonumber(iseconds)
  if seconds == 0 then
    return "00:00:00";
  else
    local hours = string.format("%02.f", math.floor(seconds/3600));
    local mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    local secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours..":"..mins..":"..secs
  end
end
 
audio.tts("Willkommen!")
audio.play(respath .. "Steiner Chilbi Schottisch Jost Ribary.mp3")
 
while true do
  -- example for event handling, if we have more than one event -> ignore them
  -- Att: If one of the messages is FILE_END you will discard it 
  if event.count() > 1 then
    print("Please do not 'hammer' the keys")
    event.clear()
  end
  -- check events
  ev = event.pop()
  if ev == event.FILE_END or ev == event.KEY_MODE then
    _print("FILE_END");
    break
  end
  if ev == event.KEY_REC then
    _print("KEY_REC");
    status = audio.status()
    if status.status == 'play' then
      audio.stop()
    else
      audio.play(respath .. "Steiner Chilbi Schottisch Jost Ribary.mp3")
    end
  end
  if ev == event.KEY_PLAY then
    _print("KEY_PLAY");
    status = audio.status()
    if status.status == 'play' then
      audio.pause()
      print("Elapsed: " .. tostring(secondstoclock(status.elapsed/1000)))
      print("Remaining: " .. tostring(secondstoclock(status.remaining/1000)))
    else
      audio.resume()
    end
  end
 
  timer.delay(1000)
end
