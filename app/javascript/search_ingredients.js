const search_ingredients = () => {
  if(document.getElementById("search_btn")){
    const inputElement = document.getElementById("keyword");
    inputElement.addEventListener("keyup", () => {
      const keyword = inputElement.value;
      const xhr = new XMLHttpRequest();
      // indexとsearchビューのURLが違うため1つずつ別のものを用意
      if (location.pathname.match("recipes/search")){
        xhr.open("GET", `incremental_search?keyword=${keyword}`, true);
      }else{
        xhr.open("GET", `recipes/incremental_search?keyword=${keyword}`, true);
      };
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = () => {
        const ingredients = xhr.response.keyword;
        const searchResult = document.getElementById("search_result");
        searchResult.innerHTML = "";
        if (xhr.response.keyword){
          ingredients.forEach((ingredient) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", ingredient.id);
            childElement.innerHTML = ingredient.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(ingredient.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("keyword").value = clickElement.textContent;
              searchResult.innerHTML = "";
            });
          });
        };
      };
    });
  };
};

window.addEventListener('load', search_ingredients)