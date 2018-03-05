# Basics and structure of Milestone LUA programs

LUA programs on the Milestone comply to a large extent with the LUA 5.3 specification. However, there are some unique requirements.

## Directory structure and description file

An LUA program is started from within the application 'Audio'. To enable the audio player to find the LUA programs,
each program gets its subdirectory with the following obligatory structure (the name of the program is here' Sample'):

    Apps
       └ Sample.lua
                  ├ main.lua
                  └ manifest.lua
                         
The programs directory must have the extension. lua, the file main.lua contains the program and the file manifest.lua 
contains a multilingual program description in the form:

    - Test manifest
    name =' Test'.
    version =' 1.0'.
    license = GPL
    desc = {
         en ='Sample',
         de ='Beispiel'.
    }

The language abbreviations correspond to the ISO 639-1 codes, which are used by the Language Module.

### LUA Main Program
Each Bones Milestone LUA program must include the' BonesMilestone' module:

    -- Platform modules
    require "BonesMilestone" -- always necessary 

This module ensures that all Bones Milestone Modules specific modules are loaded and a cross-platform development is possible
to some extent, i. e. that you can develop your Bones Milestone LUA programs on the PC and run them without any further source
modification on the audio player.
