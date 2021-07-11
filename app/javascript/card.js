const pay = () => {
  Payjp.setPublicKey("pk_test_3a7101d56406826c9e6f0f69"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("charge-form");
  submit.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_buyer[number]"),
      cvc: formData.get("purchase_buyer[cvc]"),
      exp_month: formData.get("purchase_buyer[exp_month]"),
      exp_year: `20${formData.get("purchase_buyer[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);