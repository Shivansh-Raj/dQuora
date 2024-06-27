
    function toast_diaplay(message) {
        $('.toast-body').text(message)
        $('#myToast').toast('show');
    };
    


/* Modify */
    function showModificationPopup(post_id){
      localStorage.setItem('item_to_modify', post_id);
      $('#modification-popup').css('display','flex')
      var postQuery = $('#postList li[data-post-id="query-' + post_id + '"]').text();
      var postContent = $('#postList li[data-post-id="content-' + post_id + '"]').text();
      console.log(postQuery)
      $('#query-modify-input').val(postQuery)
      $('#myTextarea').val(postContent)
    }


    $(document).ready(function() {
        $('#modification-form').on('submit', function(event) {
            event.preventDefault(); // Prevent default form submission
            
            var post_id = localStorage.getItem('item_to_modify');
            console.log(post_id)
            var formData = new FormData(this);
            console.log(formData)
            
            $.ajax({
                url: '/modify_post/' + post_id, // Fix the variable name
                method: 'POST',
                data: formData,
                processData: false, // Prevent jQuery from transforming the data into a query string
                contentType: false, // Necessary for file upload
                headers: {
                    'X-CSRFToken': getCSRFToken() // Set the CSRF token header
                },
                success: function(data) {
                    var message = data.message;
                    toast_display(message); // Correct the function name
                },
                error: function(xhr, status, error) {
                    console.error('Error modifying post:', status, error);
                    toast_display('Error modifying post.'); // Correct the function name
                }
            });
        });
    
        function getCSRFToken() {
            return document.querySelector('[name=csrfmiddlewaretoken]').value;
        }
    
        function toast_display(message) {
            $('.toast-body').text(message);
            $('#myToast').toast({ delay: 3000 });
            $('#myToast').toast('show');
        }
    });




    $('#post-img').click(function(){
        $(this).toggleClass('post-img post-img-full')
      })
