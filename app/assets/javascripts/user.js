$(document).ready(function () {
  if ($(".upgrade_show").value == false){
    $('.upgrades_list').hide();
    alert('anything')
  }
  $('.show_upgrades').click(function() {
    if ($(".upgrades_show").value == true) {
      $(".upgrades_show").value = false;
    } else {
      $(".upgrades_show").value = true;
    }
    $('.upgrades_list').show();
    $('.upgrades_show').value = true;
  });
});
