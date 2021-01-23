<script>

  const img_src = ["adventur.png", "img2.jpg", "img3.jpg"];
  let num = -1;

  function slide_time() {
 
   num = Math.floor(Math.random() * img_src.length);

   document.getElementById("slide_img").src = img_src[num];
  }

  setInterval(slide_time, 3000);

</script>