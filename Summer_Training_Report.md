# SUMMER TRAINING REPORT
## ON
# ROCK PAPER SCISSORS GAME

**School of Computer Science and Engineering**  
**Lovely Professional University**

Submitted in partial fulfilment of the requirements for the award of the degree of **Bachelor of Technology in Computer Science and Engineering**.

Submitted by: **[YOUR NAME]**  
Registration No.: **[YOUR REGISTRATION NUMBER]**  
Semester: **[YOUR SEMESTER]**

Under the guidance of: **[GUIDE NAME]**  
Department of Computer Science and Engineering

\newpage

# DECLARATION

I hereby declare that the Summer Training / Internship Project entitled **“Rock Paper Scissors Game”** is a record of my original work. It was completed under the supervision of **[GUIDE NAME]** and has not been submitted to any other university or institution for the award of any degree or diploma.

Date: [DATE]  
Place: [PLACE]

**[YOUR NAME]**  
Registration No.: [YOUR REGISTRATION NUMBER]

# CERTIFICATE

This is to certify that the Summer Training / Internship Report entitled **“Rock Paper Scissors Game”** submitted by **[YOUR NAME]** (Registration No. **[YOUR REGISTRATION NUMBER]**) is a record of project work completed under my guidance and supervision in partial fulfilment of the requirements for the Bachelor of Technology degree in Computer Science and Engineering.

**[GUIDE NAME]**  
Department of CSE, Lovely Professional University

\newpage

# ACKNOWLEDGEMENT

I express my sincere gratitude to my guide, **[GUIDE NAME]**, for valuable guidance, continuous support, and encouragement during this project. I also thank the Department of Computer Science and Engineering, Lovely Professional University, for providing the opportunity to develop practical programming skills.

I am grateful to my friends and family for their motivation and support. Finally, I acknowledge the C++ learning resources and documentation that helped me understand program logic, conditional statements, loops, random number generation, and console-based application development.

# TABLE OF CONTENTS

1. Introduction of Organization  
   1.1 Overview of Organization  
   1.2 Training Divisions and Focus Areas  
2. Summer Training Course/Internship Content Detail  
   2.1 Course Objectives  
   2.2 Detailed Training Curriculum  
3. Summer Training/Internship Project Detail  
   3.1 Problem Statement  
   3.2 Design and Architecture  
   3.3 Program Logic and Implementation  
   3.4 Project Outcomes and Complexity Analysis  
   3.5 Technologies Used  
4. Source Code and System Snapshots  
   4.1 C++ Source Code  
   4.2 Step-by-Step Walkthrough  
5. Bibliography

\newpage

# 1. INTRODUCTION OF ORGANIZATION

## 1.1 Overview of Organization

Lovely Professional University provides technical education and practical learning opportunities for students. The Department of Computer Science and Engineering promotes knowledge of programming, software development, problem-solving, and modern computer technologies through courses and project-based learning.

## 1.2 Training Divisions and Focus Areas

The training focused on C++ programming fundamentals, variables and data types, conditional statements, loops, random number generation, console applications, debugging, and testing.

# 2. SUMMER TRAINING COURSE/INTERNSHIP CONTENT DETAIL

## 2.1 Course Objectives

The objectives were to understand C++ fundamentals, use conditional statements for decision-making, implement loops for repeated tasks, generate random values, create an interactive console application, and improve debugging and problem-solving skills.

## 2.2 Detailed Training Curriculum

The training covered C++ syntax, input/output with `cin` and `cout`, variables, operators, `if-else` conditions, `switch` statements, `do-while` loops, header files, random-number generation, input validation, and console-based project development.

\newpage

# 3. SUMMER TRAINING/INTERNSHIP PROJECT DETAIL

## 3.1 Problem Statement

The project develops a console-based Rock Paper Scissors game in C++. The user selects Rock, Paper, or Scissors, while the computer generates a random choice. The program compares both selections, displays the round result, maintains scores for the user, computer, and draws, and allows multiple rounds.

## 3.2 Design and Architecture

The project uses a simple procedural architecture. It contains these logical components: user input, input validation, random computer selection, choice display, result comparison, score management, and a replay loop.

Program flow: Start → display menu → take and validate choice → generate computer choice → compare choices → update score → ask to play again → display final score → end.

## 3.3 Program Logic and Implementation

The random-number generator is initialized by `srand(time(0))`. The computer choice is calculated using `rand() % 3 + 1`, giving a value from one to three. `switch` statements display the textual choice. Conditional statements determine whether the round is a draw, a user win, or a computer win. A `do-while` loop continues the game when the user enters Y or y.

## 3.4 Project Outcomes and Complexity Analysis

The completed project accepts valid input, produces a random computer move, determines the winner correctly, updates the scoreboard, and displays the overall winner when the game ends. Each round has time complexity **O(1)** because choice generation, comparison, and score updates use a fixed number of operations. Space complexity is also **O(1)** because only a few variables are used.

## 3.5 Technologies Used

- Programming language: C++
- Libraries: `iostream`, `cstdlib`, and `ctime`
- Development environment: Visual Studio Code
- Compiler: GCC / MinGW
- Application type: Console-based game
- Operating system: Windows

\newpage

# 4. SOURCE CODE AND SYSTEM SNAPSHOTS

## 4.1 C++ Source Code (main.cpp)

```cpp
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main() {
    srand(time(0));
    int userChoice, computerChoice;
    int userScore = 0, computerScore = 0, drawScore = 0;
    char playAgain;
    do {
        cout << "\\nROCK PAPER SCISSORS GAME\\n";
        cout << "1. Rock\\n2. Paper\\n3. Scissors\\n";
        cout << "Enter your choice (1-3): ";
        cin >> userChoice;
        if (userChoice < 1 || userChoice > 3) {
            cout << "Invalid Choice! Try Again.\\n";
            continue;
        }
        computerChoice = rand() % 3 + 1;
        if (userChoice == computerChoice) {
            cout << "Result : Draw!\\n"; drawScore++;
        } else if ((userChoice == 1 && computerChoice == 3) ||
                   (userChoice == 2 && computerChoice == 1) ||
                   (userChoice == 3 && computerChoice == 2)) {
            cout << "Result : You Win!\\n"; userScore++;
        } else {
            cout << "Result : Computer Wins!\\n"; computerScore++;
        }
        cout << "You: " << userScore << " Computer: " << computerScore
             << " Draw: " << drawScore << endl;
        cout << "Play Again? (Y/N): ";
        cin >> playAgain;
    } while (playAgain == 'Y' || playAgain == 'y');
    return 0;
}
```

## 4.2 Step-by-Step Walkthrough

**Step 1: Launch.** The application displays the game title, three choices, and an input prompt.

**Step 2: User choice.** The user enters 1 for Rock, 2 for Paper, or 3 for Scissors. Invalid choices are rejected.

**Step 3: Computer choice.** The program randomly selects a value from 1 to 3.

**Step 4: Result.** The game compares user and computer selections and announces the winner or draw.

**Step 5: Scoreboard.** User, computer, and draw scores are displayed after each round.

**Step 6: Replay.** The user enters Y to play another round or N to finish and see the final score.

# 5. BIBLIOGRAPHY

1. Bjarne Stroustrup, *The C++ Programming Language*, Addison-Wesley.
2. Herbert Schildt, *C++: The Complete Reference*, McGraw-Hill.
3. C++ Reference, *C++ Standard Library Documentation*, https://en.cppreference.com.
4. GeeksforGeeks, *C++ Programming Language*, https://www.geeksforgeeks.org/c-plus-plus/.
