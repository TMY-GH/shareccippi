// いいねの非同期通信作りましたが、remote: trueするだけでよかったみたいです

// const add_like = () => {
//   if (document.getElementById("like")){
//     // お気に入りに追加する
//     const like_button = document.getElementById("add_like");
//     like_button.addEventListener('click', (e) => {
//       e.preventDefault();

//       const form = document.querySelector("form");
//       console.log(form);
//       xhr = new XMLHttpRequest();
//       const path = location.pathname;
//       xhr.open("POST", `${path}/user_likes`, true);
//       xhr.responseType = "json";
//       xhr.send();
//     });
//     // お気に入りから削除する
//     const remove_button = document.getElementById("remove_like");
//     remove_button.addEventListener('click', (e) => {
//       e.preventDefault();

//       xhr = new XMLHttpRequest();
//       const path = location.pathname;
//       xhr.open("DELETE", `${path}/user_likes/:id`, true);
//       xhr.responseType = "json";
//       xhr.send(); 
//     });
//   };
// };

// window.addEventListener('load', add_like);