# Bones Milestone specific LUA modules

## Milestone

The milestone module contains basic functions for the milestone hardware or configuration settings. At the moment these are the following functions:


* respath

### respath

    respath(path)

''respath'' returns the platform-independent path to subdirectories and is used as a tool for developing Milestone LUA programs on the PC. With the help of this function, it is possible to use the same program code in terms of paths as on the device itself under the development environment.

Example:

Open a text file from the subdirectory `.\save\`

```lua
-- Get resource path
local respath = Milestone.respath('save')
local f = io.open(respath .. "highscore.txt", "w+")
```
