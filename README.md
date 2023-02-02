# Solid Software Test Task
## Task overview
Make an application that randomly changes its color after taping on sceen (without using external libraries for color generation).
## Implementation details
* Because of the restriction on using external libraries for color generation I implemented my own
pseudorandom integers generators (one based on Linear Congruence generator algorithm and the 
second one based on Fibonacci sequence).
* Using those generators ColorGenerator was implemented.
## Additional features
* In order to increase randomness of pseudorandom integers generators, [x;y] coordinates of the first tap 
on the screen were used as first seed and second seed for the Fibonacci generator.
* Added __Change color range__ button. User can choose the color using a fancy color 
picker and after that, generator will produce the same color of a different shade.
In order to get back to complete random color generation user have to push __Reset__
button.
* Label "Hey there" changes its color and an outline color depending on the color of the screen for 
better visibility.