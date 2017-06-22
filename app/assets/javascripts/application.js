// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_self
//
//

jQuery(document).ready(function(){
  jQuery('a#add-image-form').on('click', function(){
    var existingImageForm = jQuery('#new_image');
    var newImageForm      = existingImageForm.clone();
    var last_index     = parseInt( existingImageForm.find('input').first().attr('name').match(/[\d+]/), 10); 


    newImageForm.find('input').each(function(index, input) {
      input = jQuery(input);
      var new_name_value = input.attr('name').replace('[' + last_index + ']', '[' + (last_index + 1) + ']');
      input.attr('name', new_name_value);
      input.val(null); // null -> nil
    });
    existingImageForm.after(newImageForm);
    existingImageForm.removeAttr('id');
    
  });
});
