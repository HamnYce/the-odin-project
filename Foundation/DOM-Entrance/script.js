const container = document.querySelector("#container");


function appendNode(parentNode,childElement,color,textCont = "") {
    const childNode = document.createElement(childElement);
    childNode.style.color = color;
    childNode.innerHTML = textCont;

    parentNode.appendChild(childNode);
}
//creating p element
appendNode(container,"p","red","Hey I'm red!");
//creating h3 element
appendNode(container,"h3","blue","Hey I'm blue!")


function addDiv() {
    const header1 = document.createElement('h1');
    header1.textContent = "I'm in a div";

    const para = document.createElement('p');
    para.textContent = "ME TOO!!!";

    const div = document.createElement('div');
    div.appendChild(header1);
    div.appendChild(para);

    container.appendChild(div);
}
addDiv();


const btn2 = document.querySelector("#btn2");
//btn2.onclick = () => {alert('Hello World')};



const btn3 = document.querySelector("#btn3");

//btn3.addEventListener('click', () => {
//    alert("Hello World")
//});
//or

function alertUser() {
    alert("HELLO WORLD!");
}

btn3.addEventListener('click',(e) => {
    e.target.style.backgroundColor = "bl";
})

const buttons = document.querySelectorAll('button');

buttons.forEach((button) => {

    button.addEventListener('click',() => {
        
        button.style.backgroundColor = "red";
    })
})



