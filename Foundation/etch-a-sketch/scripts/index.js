
function getRandomRGB() {
    return Math.floor((Math.random()*255) + 1);
}

function makeColorDarker(e) {
    let filter = e.target.style.filter 
    let brightness = filter.split(')')[0].split('(')[1].split('%')[0]
    if (brightness >= 10) {
        e.target.style.filter = `brightness(${brightness-10}%)`
    }
    else {
        e.target.removeEventListener('mouseenter',makeColorDarker)
    }
}

function addBackColorBlack(e) {
    const red = getRandomRGB();
    const green = getRandomRGB();
    const blue = getRandomRGB();
    e.target.style.backgroundColor = `rgb(${red},${green},${blue})`;
    e.target.style.filter = "brightness(100%)"
    e.target.addEventListener('mouseenter',makeColorDarker)
}

function createGrid(n) {
    const main = document.querySelector('#main-container');
    for (let i = 0;i < n;i++) {
        const div = document.createElement('div');
        div.classList.add('outer-div')
        main.appendChild(div);
        for (let j = 0;j < n; j ++) {
            const div2 = document.createElement('div');
            div2.classList.add('inner-div')
            div.appendChild(div2);
        }
    }
    const gridDivs = document.querySelectorAll('.inner-div');
    gridDivs.forEach((gridDiv) => {
        gridDiv.addEventListener('mouseenter',addBackColorBlack, {
            once:true
        })
    })
}
createGrid(10)

function emptyGrid() {
    //considered using once:true for addEventListner
    //however it only removes once invoked, which is not ideal here
    //(might not use all pixels before reseting canvas)
    //NOTE:: After testing the getEventListeners for all returned
    //same value
    const main = document.querySelector('#main-container')
    const gridDivs = document.querySelectorAll('.inner-div');
    gridDivs.forEach((gridDiv) => {
        gridDiv.removeEventListener('mouseenter',addBackColorBlack)
    })
    while (main.firstChild) {
        
        main.firstChild.remove()
    }
    
        
}

function reset(promptText = "how big would you like your grid to be? (1-100)\ncancel or 0 to exit without doing anything") {
    let gridSize = Number(prompt(promptText))
    if (gridSize == 0) {
        return;
    }
    if (isNaN(gridSize) || gridSize < 1 || gridSize > 100) {
        reset("Please enter a valid number between 1 & 100 ^_^")
    }
    else {
        
        emptyGrid()
        createGrid(Number(gridSize))
        
    }
    
}
