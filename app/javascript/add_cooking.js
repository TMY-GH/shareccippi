const add_cooking = () => {
  if (document.getElementById("add_cooking_btn")){
    // 追加ボタン
    const plus_btn = document.getElementById("add_cooking_btn");
    let cooking_num = 0;
    plus_btn.addEventListener('click', () => {
      const html = `
      <div id="cooking_${cooking_num}">
        <textarea name="recipe_form[contents][]" rows="4" id="recipe_form_content"></textarea></div>`;
      const place = document.getElementById("cooking-space");
      place.insertAdjacentHTML('beforeend', html);
      // 入力欄を何個まで増やせるか
      max_input = 9;
      // 削除ボタンの作成＆追加
      const remove_button = document.createElement("i");
      remove_button.classList.add("fas", "fa-times-circle", "remove_btn");
      remove_button.setAttribute("style", "cursor:pointer;");
      const parent = document.getElementById(`cooking_${cooking_num}`);
      console.log(parent);
      parent.appendChild(remove_button);
      remove_button.addEventListener('click', ()=>{
        parent.remove();
        cooking_max -= 1;
        // 削除したことで入力欄がまた増やせるようになります
        if (cooking_max < max_input){
          plus_btn.removeAttribute("style", "display:none;");
        };
      });
      cooking_num += 1;
      cooking_max += 1;
      // 入力欄がmax_inputに言ったら＋ボタンが消えます
      if (cooking_max == max_input) {
        plus_btn.setAttribute("style", "display:none;");
      };
    });
      
  };
};
const remove_cooking = () => {
  console.log("success");
  if (document.getElementsByClassName("remove_cooking_btn")[0]){
    const remove_buttons = document.getElementsByClassName("remove_cooking_btn");
    for (let i = 0; i < remove_buttons.length; i++) {
      remove_buttons[i].addEventListener('click', () => {
        let parent = remove_buttons[i].parentNode;
        parent.remove();
        cooking_max -= 1;
      });
    };
  };
};
let cooking_max = 0;
window.addEventListener('load', add_cooking);
window.addEventListener('load', remove_cooking);