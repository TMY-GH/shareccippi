const like_animation = () => {
  if (document.getElementById("render_like_form")){
    let like_btn = document.getElementsByClassName("like-button");
    like_btn = like_btn[0];
    like_btn.addEventListener('mousedown', () =>{
      like_btn.style.fontSize = "79px";
    });
    like_btn.addEventListener('mouseup', () =>{
      like_btn.style.fontSize = "80px";
    });
  };
};

window.addEventListener('load', like_animation);