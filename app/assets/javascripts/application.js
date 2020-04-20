// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$('button').click(function() {
    var r = $('input[name="sample"]:checked').val();
 
    console.log(r);
})


function getRadioValue(name){
  //ラジオボタンオブジェクトを取得する
  var radios = document.getElementsByName(name);
 
  //取得したラジオボタンオブジェクトから選択されたものを探し出す
  var result;
  for(var i=0; i<radios.length; i++){
    if (radios[i].checked) {
      //選択されたラジオボタンのvalue値を取得する
      result = radios[i].value;
      break;
    }
  }
 
  //value値を表示する
  alert("value値は" + result + "です");
}