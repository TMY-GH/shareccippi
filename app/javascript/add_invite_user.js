const add_invite_user = () => {
  if (document.getElementById("add_invite_user_btn")){
    // 追加ボタン
    const plus_btn = document.getElementById("add_invite_user_btn");
    let invite_user_num = 0;
    plus_btn.addEventListener('click', () => {
      const html = `
      <div class="invite-user" id="invite_user_${invite_user_num}">
        <input placeholder="招待したいユーザーのIDを入力してください" name="group_form[user_names][]" type="text" id="group_form_user_id"></div>`;
      const place = document.getElementById("invite-user-space");
      place.insertAdjacentHTML('beforeend', html);
      // 削除ボタンの作成＆追加
      const remove_button = document.createElement("i");
      remove_button.classList.add("fas", "fa-times-circle", "remove_btn");
      remove_button.setAttribute("style", "cursor:pointer;");
      const parent = document.getElementById(`invite_user_${invite_user_num}`);
      parent.appendChild(remove_button);
      remove_button.addEventListener('click', ()=>{
        parent.remove();
      });
      invite_user_num += 1;
    });
      
  };
};
const remove_invite_user = () => {
  if (document.getElementsByClassName("remove_user_btn")[0]){
    const remove_buttons = document.getElementsByClassName("remove_user_btn");
    for (let i = 0; i < remove_buttons.length; i++) {
      remove_buttons[i].addEventListener('click', () => {
        let parent = remove_buttons[i].parentNode;
        parent.remove();
      });
    };
  };
};
window.addEventListener('load', add_invite_user);
window.addEventListener('load', remove_invite_user);