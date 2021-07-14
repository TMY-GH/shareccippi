const show_modal = () => {
  if (document.getElementById("show_destroy_modal")){
    // モーダル表示
    const on_button = document.getElementById("show_destroy_modal");
    const modal = document.getElementById("destroy_modal");
    on_button.addEventListener('click', () => {
      modal.classList.toggle('active');
    });
    // モーダル非表示
    const off_button = document.getElementById("destroy_modal_off");
    off_button.addEventListener('click', () => {
      modal.classList.toggle('active');
    });
  };
};

window.addEventListener('load', show_modal);