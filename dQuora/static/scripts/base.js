
document.getElementById('imageInput').addEventListener('change', function(event) {
    const fileName = event.target.files[0].name;
    document.getElementById('selectedFile').textContent = `Selected file: ${fileName}`;
});


$(document).ready(function() {

  if (localStorage.getItem('darkMode') === null) {
    localStorage.setItem('darkMode', 'enabled');
  }

  // Check if dark mode was previously enabled
  if (localStorage.getItem('darkMode') === 'enabled') {
    console.log('enabling darkmode')
      enableDarkMode();
  } else{
        console.log('disabling darkmode')
    disableDarkMode()
  }

  // Toggle dark mode on button click
  $('#toggleSwitch').on('click', function() {
      if (localStorage.getItem('darkMode') === 'enabled') {
          disableDarkMode();
      } else {
          enableDarkMode();
      }
  });
  function enableDarkMode(){
      $('body').addClass('dark');
      $('#toggleSwitch').addClass('dark');
      $('#toggleLabel').addClass('dark-mode');
      $('.toggleclasses').addClass('dark');
      localStorage.setItem('darkMode', 'enabled');
    $('#toggleSwitch').on('click', function() {
    });
  }
  function disableDarkMode(){
      $('body').removeClass('dark');
      $('#toggleSwitch').removeClass('dark');
      $('#toggleLabel').removeClass('dark-mode');
      $('.toggleclasses').removeClass('dark');
      localStorage.setItem('darkMode', 'disabled');
    $('#toggleSwitch').on('click', function() {
    });
  }
});



document.addEventListener("DOMContentLoaded", function() {
  document.getElementById('loaderContainer').style.display = 'flex';
});
$(document).ready(
  setTimeout(function() {
    $('#loaderContainer').css('display', 'none');
  },2000)
);



$(document).ready(function() {
    const $inputBox = $('#expandable-inputBox');
    const $elementsToHide = $('.elementToHide');

    $inputBox.on('focus', function() {
        $elementsToHide.hide()
    });

    $inputBox.on('blur', function() {
      setTimeout(function() {
        $elementsToHide.show()
      },300)
    });
});


$('#query-button').click(function(){
  $('#post-button').css('border-bottom','2px solid #000')
  $('#query-button').css('border-bottom','4px solid #f07777')
  $('#query-form').css('display','')
  $('#post-form').css('display','none')

})
$('#post-button').click(function(){
  $('#query-button').css('border-bottom','2px solid #000')
  $('#post-button').css('border-bottom','4px solid #f07777')
  $('#query-form').css('display','none')
  $('#post-form').css('display','')

})



function closePopupBox(){
  $('.loader-container-popup').css('display','none')
}


function showPostPopup(){
  $('#query-post-popup').css('display','flex')
}


// Update button text with selected option and set hidden input value
function dropdown_selected(cat_name,cat_id){
  $('#category-dropdown').text(cat_name),
  $('#category-selected').val(cat_id)
}


$(document).ready(function() {
    $('#myTextarea').on('input', function() {
        var textLength = $(this).val().length;
        $('#charCount').text('Character Count: ' + textLength+'/1500');
        if(textLength > 1500){
          $('#charCount').css('color','red')
          $('#form-submit-btn').prop('disabled', true);
          $('#form-submit-btn').css('background-color','grey')
        }else{
          $('#charCount').css('color','black')
          $('#form-submit-btn').prop('disabled', false);
          $('#form-submit-btn').css('background-color','#f07777' )

        }
    });
});

