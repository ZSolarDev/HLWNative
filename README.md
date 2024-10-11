# HLWNative
HashLink Windows Native.

## What is it?
These are externs for HashLink that allow you to run a (currently small) library of native windows functions.

## How do I use it?
it's not done yet, should be complete within hours though

# HLWNative Insight
This is insight on HLWNative.
## How did I make it?
It was very simple. I just took cpp function code in my games NativeFunctions.hx and put it in an actual cpp file. I then created externs from that code.
## What led me to make this?
Well that's very simple too; I noticed that I had to surround my native functions with #if cpp. The thing is, I had a function to make the titlebar dark mode as it fit really well with the game; but ai didn't have that luxury when compiling to HashLink for a quick test. Thats when i thought, "Hmm, it wouldn't be that hard to make native windows functions for HashLink, I already have the code for the functions anyway. It wouldn't hurt to make a library for them."

# Credits
[CoreCat](github.com/corecathx): Added NativeWindows.hx to the game

[ZSolarDev](github.com/ZSolarDev): Made the externs
