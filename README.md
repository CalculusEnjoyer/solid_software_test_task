# Random Color Test Task
## Task overview
Make an application that randomly changes its color after taping on screen (without using external libraries for color generation).
## Implementation details
* Because of the restriction on using external libraries for the color generation I implemented my own
  pseudorandom integers generators (one based on the Linear Congruence generator algorithm and the
  second one based on the Fibonacci sequence).
* Using those generators ColorGenerator was implemented.
## Additional features
* To increase the randomness of pseudorandom integers generators, [x;y] coordinates of the first tap
  on the screen were used as the first and second seeds for the Fibonacci generator.
* Added __Change color range__ button. Users can choose the color using a fancy color
  picker and after that, a generator will produce the same color of a different shade.
  In order to get back to complete random color generation user have to push __Reset__
  button.
* Label "Hey there" changes its color and an outline color depending on the color of the screen for
  better visibility.
## Project structure
```                             
│   main.dart                    
│                                
├───pages
│   ├───common_wigdets
│   │       app_alert_dialog.dart
│   │       app_elevated_button.dart
│   │       app_text_style.dart
│   │
│   └───home
│           home_page.dart
│
└───utils
    ├───colors
    │       color_generator.dart
    │       color_processor.dart
    │
    └───random_numbers_generator
        │   my_random.dart
        │
        ├───my_fibonacci_random
        │       my_fibonacci_random.dart
        │
        └───my_linear_congruential_random
                my_lc_random.dart
```
## App demo
<img src="https://github.com/CalculusEnjoyer/volodymyr_kravchuk_test_task/blob/master/gif_demo/work_example.gif" width="320">


Thank you very much for your review and I am looking
forward to hearing from you ^_^
