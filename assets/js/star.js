var star1 = document.getElementById('star1');
var star2 = document.getElementById('star2');
var star3 = document.getElementById('star3');
var star4 = document.getElementById('star4');
var star5 = document.getElementById('star5');
star1.addEventListener("click",()=>{
star1.style.color = "#000000";
star2.style.color = "#000000";
star3.style.color = "#000000";
star4.style.color = "#000000";
star5.style.color = "#000000";
})
star2.addEventListener("click",()=>{
star1.style.color = "#ccc";
star2.style.color = "#000000";
star3.style.color = "#000000";
star4.style.color = "#000000";
star5.style.color = "#000000";
})
star3.addEventListener("click",()=>{
star1.style.color = "#ccc";
star2.style.color = "#ccc";
star3.style.color = "#000000";
star4.style.color = "#000000";
star5.style.color = "#000000";
})
star4.addEventListener("click",()=>{
star1.style.color = "#ccc";
star2.style.color = "#ccc";
star3.style.color = "#ccc";
star4.style.color = "#000000";
star5.style.color = "#000000";
})
star5.addEventListener("click",()=>{
star1.style.color = "#ccc";
star2.style.color = "#ccc";
star3.style.color = "#ccc";
star4.style.color = "#ccc";
star5.style.color = "#000000";
});