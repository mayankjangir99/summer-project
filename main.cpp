#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main()
{
    srand(time(0));

    int userChoice, computerChoice;
    int userScore = 0, computerScore = 0, drawScore = 0;
    char playAgain;

    do
    {
        cout << "\n=====================================\n";
        cout << "      ROCK PAPER SCISSORS GAME\n";
        cout << "=====================================\n";
        cout << "1. Rock\n";
        cout << "2. Paper\n";
        cout << "3. Scissors\n";
        cout << "Enter your choice (1-3): ";
        cin >> userChoice;

        if (userChoice < 1 || userChoice > 3)
        {
            cout << "\nInvalid Choice! Try Again.\n";
            continue;
        }

        // Computer Random Choice
        computerChoice = rand() % 3 + 1;

        cout << "\nYou chose: ";
        switch (userChoice)
        {
        case 1:
            cout << "Rock";
            break;
        case 2:
            cout << "Paper";
            break;
        case 3:
            cout << "Scissors";
            break;
        }

        cout << "\nComputer chose: ";
        switch (computerChoice)
        {
        case 1:
            cout << "Rock";
            break;
        case 2:
            cout << "Paper";
            break;
        case 3:
            cout << "Scissors";
            break;
        }

        cout << "\n\n";

        // Result
        if (userChoice == computerChoice)
        {
            cout << "Result : Draw!\n";
            drawScore++;
        }
        else if ((userChoice == 1 && computerChoice == 3) ||
                 (userChoice == 2 && computerChoice == 1) ||
                 (userChoice == 3 && computerChoice == 2))
        {
            cout << "Result : You Win!\n";
            userScore++;
        }
        else
        {
            cout << "Result : Computer Wins!\n";
            computerScore++;
        }

        cout << "\n-------------------------------------\n";
        cout << "Score Board\n";
        cout << "You      : " << userScore << endl;
        cout << "Computer : " << computerScore << endl;
        cout << "Draw     : " << drawScore << endl;
        cout << "-------------------------------------\n";

        cout << "\nPlay Again? (Y/N): ";
        cin >> playAgain;

    } while (playAgain == 'Y' || playAgain == 'y');

    cout << "\n=====================================\n";
    cout << "Final Score\n";
    cout << "You      : " << userScore << endl;
    cout << "Computer : " << computerScore << endl;
    cout << "Draw     : " << drawScore << endl;

    if (userScore > computerScore)
        cout << "\n🏆 Congratulations! You are the Overall Winner!\n";
    else if (computerScore > userScore)
        cout << "\n🤖 Computer is the Overall Winner!\n";
    else
        cout << "\n🤝 Match Draw!\n";

    cout << "\nThank You for Playing!\n";

    return 0;
}