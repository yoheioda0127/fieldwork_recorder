const pics_src = ["images/slider-1.jpg","images/slider-2.jpg","images/slider-3.jpg","images/slider-4.jpg","images/slider-5.jpg"];
let num = -1;


function slideshow_timer(){
  if (num === 4){
    num = 0;
  } 
  else {
    num ++;
  }
  document.getElementById("slider").src = pics_src[num];
}

setInterval(slideshow_timer, 3000);
