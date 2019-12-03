$(function(){

  var submit = document.getElementById("token_submit");

  submit.addEventListener('click', function(e){  
    e.preventDefault();  
    Payjp.setPublicKey("pk_test_5cf244f8de9e4a97c3dbf614");
    var card = {
      number: document.getElementById("card_number").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
      cvc: document.getElementById("cvc").value
    };
    if (card.number == "", card.exp_month == "1", card.exp_year == "2019", card.cvc == "") {
      alert("カード情報が入力されていません。"); 
    } else { 
      Payjp.createToken(card, function(status, response) {  
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#cvc").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          document.inputForm.submit(); 
          alert("登録が完了しました");
        } else {
          alert("正しいカード情報を入力してください。");
        }
      });
    }
    false
  });
});