/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#text').keyup(function(e){
      var keyed = $(this).val().replace(/[\n]/g,'<br/>');
      $("#target").html(keyed);
 });

