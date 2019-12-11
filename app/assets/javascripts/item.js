$(document).on('turbolinks:load', function(){
  // 金額入力
  $('#item_price').on("keyup", function(e) {
      var price = $(this).val();
      var fee = Math.floor(price * 0.1);
      $(".main-container__sell__inner__price__form__box1__fee__right").text("¥ " + fee);
      var profit = price - fee
      $(".main-container__sell__inner__price__form__box1__profit__right").text("¥ " + profit);
      e.preventDefault();
  });
})