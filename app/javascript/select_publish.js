const select_publish = () => {
  if (document.getElementById("publish")){
    const select_form = document.getElementById("publish");
    select_form.addEventListener('change', (e) => {
      const submit_btn = document.getElementById("publish_submit");
      submit_btn.click();
    });
  };
};

window.addEventListener('load', select_publish);