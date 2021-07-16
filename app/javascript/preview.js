const preview_image = () => {
  if (document.getElementById('image-preview')){
    const image_preview = document.getElementById('image-preview');
    document.getElementById('recipe_image').addEventListener('change', (e) => {
      // 既にプレビューがある場合削除する
      if (image_preview.children[0]){
        image_preview.children[0].remove();
      };

      const file = e.target.files[0];
      const image_url = window.URL.createObjectURL(file);
      const image_tag = document.createElement('img');
      image_tag.setAttribute('src', image_url);
      image_preview.appendChild(image_tag);
    });
  };
};

window.addEventListener("load", preview_image)