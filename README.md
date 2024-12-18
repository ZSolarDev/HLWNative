# HLWNative
HashLink Windows Native.
<p align="center">
  <img width="400" src="https://github.com/ZSolarDev/HLWNative/blob/main/resource/Logo.png">
</p>

### What is it?
These are externs for [HashLink](https://hashlink.haxe.org/) that allow you to run a (currently small) library of native windows functions.

### How do I use it?
Look at the examples folder! Currently only tested on [HaxeFlixel](https://haxeflixel.com), but if you can test and provide examples on other frameworks, feel free to send a Pull Request!

## HLWNative Insight
This is insight on HLWNative.
### How did I make it?
It was very simple. I just took cpp function code in my game's NativeFunctions.hx and put it in an actual cpp file. I then created externs from that code.
### What led me to make this?
Well that's very simple too; I noticed that I had to surround my native functions with #if cpp. The thing is, I had a function to make the titlebar dark mode as it fit really well with a game I'm working on; but I didn't have that luxury when compiling to HashLink for a quick test. Thats when I thought something along the lines of, "Hmm, it wouldn't be that hard to make native windows functions for HashLink, I already have the code for the functions anyway. It wouldn't hurt to make a library for them."

# Credits
[CoreCat](https://www.github.com/corecathx): Added NativeWindows.hx to a game I'm working on. (I based some of these externs off of that .hx file.)

[ZSolarDev](https://www.github.com/ZSolarDev): Made the externs
