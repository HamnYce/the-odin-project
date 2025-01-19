const choices = document.querySelectorAll(".choice");
const resultBox = document.querySelector("#result-box");
const startButton = document.querySelector("#start");
const playerScoreDisplay = document.querySelector("#player-score");
const computerScoreDisplay = document.querySelector("#computer-score");
const TotalScoreDisplay = document.querySelector("#total-score");
let playerScore = 0,computerScore = 0;
let totalScore = 0;

startButton.onclick = playGame;

function playComputer() {
    let rand = Math.floor(Math.random()*3)+1;
    if (rand == 1) 
        return "rock";
    else if (rand == 2)
        return "paper";
    else
        return "scissors";
};

function playRound(player,computer) {
    player = player.toLowerCase();
    if (player == "rock") {
        if (computer  == "scissors")
            return "player";
        else if (computer == "paper")
            return "computer";
        else
            return "draw";
    }
    else if (player == "paper") {
        if (computer == "rock")
            return "player";
        else if (computer == "scissors")
            return "computer";
        else 
            return "draw";
    }
    else if (player == "scissors") {
        if (computer == "paper")
            return "player";
        else if (computer == "rock")
            return  "computer";
        else
            return "draw";
    }
};

function playGame() {
    playerScore = 0,computerScore = 0,totalScore = 0;
    //CSS Resets:
    //display
    playerScoreDisplay.textContent = "Player Score: 0";
    computerScoreDisplay.textContent = "CPU Score: 0";
    TotalScoreDisplay.textContent = "Total Score: 0";
    //startbutton
    startButton.style.backgroundColor = "rgba(199, 33, 33, 1)";
    startButton.style.color = "white";
    startButton.textContent = "Restart?";
    //resultBox
    resultBox.textContent = "Who will win?";
    //add event listeners
    //1) game counter + increnter
    //2) click effect remover
    choices.forEach((choice) => {
        choice.addEventListener('click',countGame);
        choice.addEventListener('transitionend',(e) => {
            e.target.classList.remove('chosen')
        })
    });
};

function countGame(e) {
    console.log("count game");
    let playerInput = e.target.id;
    let computerInput = playComputer();
    let result = playRound(playerInput,computerInput)
    e.target.classList.add('chosen')
    if (result == "player") {
        playerScore += 1;
        totalScore += 1;
        playerScoreDisplay.textContent  = `Player Score: ${playerScore}`;
        resultBox.textContent = `Player's ${playerInput} beats Computer's ${computerInput}!`;
    } 
    else if (result == "computer") {
        computerScore += 1;
        totalScore += 1;
        computerScoreDisplay.textContent = `CPU Score: ${computerScore}`;
        resultBox.textContent = `Computer's ${computerInput} beats Player's ${playerInput}!`;
    }
    else {
        resultBox.textContent = "It's a DRAW!";
    }

    TotalScoreDisplay.textContent = `Total Score: ${totalScore}`;

    if (playerScore >= 5 || computerScore >= 5) {
        endGame();
    }
};

function endGame() {
    //startbutton reset
    startButton.style.backgroundColor = "green";
    startButton.textContent = "Start Again?";
    //stop game
    choices.forEach((choice) => {
        choice.removeEventListener('click',countGame);
    });
};