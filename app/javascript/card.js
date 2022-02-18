const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const submit = document.getElementById("charge-form");
  submit.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_buyer[number]"),
      cvc: formData.get("order_buyer[cvc]"),
      exp_month: formData.get("order_buyer[exp_month]"),
      exp_year: `20${formData.get("order_buyer[exp_year]")}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
        document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
      } else {
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value="" type="hidden" name='token'>`
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();;
      }
    });
  });
};

window.addEventListener("load", pay);