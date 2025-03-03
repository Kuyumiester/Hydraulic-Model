# Finding Pipe Pressures in a Hydraulic System

Given the diameters of hydraulic pipes in a system and their relationships to each other, as well
as the pressure at a given point, this program will find the pressures in every pipe according to
Bernoulli's principle. This model assumes the pump provides constant flow regardless of pressure,
and assumes all pipes are at the same elevation.

![results](/screenshot.png)

### To compile and run the program

This program is written in the Zig programming language.  
See this page for installing Zig: https://ziglang.org/learn/getting-started/#direct

Open a terminal emulator in the same directory/folder as the "build.zig" file and "src" folder, then enter:

    zig build run
