const add_ingredient = () => {
  if (document.getElementById("add_ingredient_btn")){
    // 追加ボタン
    const plus_btn = document.getElementById("add_ingredient_btn");
    let ingredient_num = 0;
    let ingredient_max = 0;
    plus_btn.addEventListener('click', () => {
      const html = `
      <div class="ingredient" id="ingredient_${ingredient_num}">
        <select name="recipe_form[ingredient_ids][]" id="recipe_form_ingredient_id"><option value="1">---</option>
          <option value="2">牛肉 (g)</option>
          <option value="3">豚肉 (g)</option>
          <option value="4">鶏肉 (g)</option>
          <option value="5">ひき肉 (g)</option>
          <option value="6">---</option>
          <option value="7">玉ねぎ (個)</option>
          <option value="8">じゃがいも (個)</option>
          <option value="9">にんじん (本)</option>
          <option value="10">セロリ (本)</option>
          <option value="11">ナス (本)</option>
          <option value="12">トマト (個)</option>
          <option value="13">きゅうり (本)</option>
          <option value="14">レタス (個)</option>
          <option value="15">キャベツ (個)</option>
          <option value="16">ブロッコリー (個)</option>
          <option value="17">ピーマン (個)</option>
          <option value="18">カラーピーマン (個)</option>
          <option value="19">ズッキーニ (本)</option>
          <option value="20">しめじ (パック)</option>
          <option value="21">ニンニク (片)</option>
          <option value="22">---</option>
          <option value="23">卵 (個)</option>
          <option value="24">牛乳 (cc)</option>
          <option value="25">チーズ (g)</option>
          <option value="26">バター (g)</option>
          <option value="27">ヨーグルト (cc)</option>
          <option value="28">クリーム (cc)</option>
          <option value="29">練乳 (cc)</option>
          <option value="30">---</option>
          <option value="31">米 (g)</option>
          <option value="32">食パン (枚)</option>
          <option value="33">スパゲティ (g)</option>
          <option value="34">小麦粉 (g)</option>
          <option value="35">---</option>
          <option value="36">ケチャップ (大さじ)</option>
          <option value="37">マヨネーズ (大さじ)</option>
          <option value="38">しょうゆ (大さじ)</option>
          <option value="39">お酢 (大さじ)</option>
          <option value="40">みりん (大さじ)</option>
          <option value="41">料理酒 (大さじ)</option>
          <option value="42">サラダ油 (大さじ)</option>
          <option value="43">ごま油 (大さじ)</option>
          <option value="44">塩 (小さじ)</option>
          <option value="45">こしょう (小さじ)</option>
          <option value="46">コンソメ (キューブ)</option>
          <option value="47">ソース (大さじ)</option>
          <option value="48">マスタード (大さじ)</option>
        </select><span class="amount">分量</span><input name="recipe_form[amounts][]" type="text" id="recipe_form_amount">
      </div>`;
      const place = document.getElementById("ingredient-space");
      place.insertAdjacentHTML('afterbegin', html);
      // 入力欄を何個まで増やせるか
      max_input = 14;
      // 削除ボタンの作成＆追加
      const remove_button = document.createElement("i");
      remove_button.classList.add("fas", "fa-times-circle", "remove_btn");
      remove_button.setAttribute("style", "cursor:pointer;");
      const parent = document.getElementById(`ingredient_${ingredient_num}`);
      parent.appendChild(remove_button);
      remove_button.addEventListener('click', ()=>{
        parent.remove();
        ingredient_max -= 1;
        // 削除したことで入力欄がまた増やせるようになります
        if (ingredient_max < max_input){
          plus_btn.removeAttribute("style", "display:none;");
        };
      });
      ingredient_num += 1;
      ingredient_max += 1;
      // 入力欄がmax_inputに言ったら＋ボタンが消えます
      if (ingredient_max == max_input) {
        plus_btn.setAttribute("style", "display:none;");
      };
    });
      
  };
};

window.addEventListener('load', add_ingredient);