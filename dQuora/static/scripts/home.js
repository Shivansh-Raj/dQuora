
  function show_content(post_id){
    $('#content-final'+post_id).css('display','flex')
  }



  const maxHeight = 150;

  function showMoreButton(post_id){
    $('#content'+post_id).css({'max-height':'none'}),
    $('#showMoreButton'+post_id).hide(),
    $('#showLessButton'+post_id).show(),
    $('#content-initial'+post_id).css('display','none'),
    $('#content-final'+post_id).css('display','flex')

    //button_positioning(post_id);
  }




  let offset=0
  let limit=3
  let posts_available=true

  function LoadPost(){
    console.log(offset)
      $.ajax({
      url:'/fetch_post',
      data: {'offset':offset},
      success:function(data){
        $('#post-loader').hide()
        console.log('SuccessFul!!!!!')
        console.log(data)
        const posts = data.posts
        let postHTML=``
        var darkModeStatus = localStorage.getItem('darkMode');
        var dark_light = (darkModeStatus==='enabled')? 'dark':'';
        for(const post of posts){
          var content = post.content.replace(/\n/g, '<br>');
          let postHTML=
          `<div class="container-fluid mb-3">
            <div class="outer-post-block toggleclasses ${dark_light} pb-0"  style="z-index:100; position:relative">
                <div class="post-block" id="content${post.id}" >
                  <div class="user-info">
                    <img src="${post.avatar} " alt="User Image">
                    <div class="d-flex" style="flex-direction:column">
                    <a href="/profile/${post.username_id}"><span style="font-weight: bold; font-size:1.2vmax">${post.username}</span></a>
                    <p style="font-size:50%">${post.time}</p>
                    </div>
                  </div>
                  <a href="post_page/${post.id}">
                  <div class="query mx-2" >
                    ${post.query}
                  </div>
                  </a>`;
          if(post.image){
                  postHTML+=  
                  `<div class="content-initial my-1"style=" line-height: 1.5;" id="content-initial${post.id}">
                    ${post.content}
                  </div>
                  <div class="post-img toggleclasses ${dark_light}">
                    <img class="" src="${post.image} " >
                  </div>`
          }else{
                  postHTML+=
                  `<div class="content-final" style="line-height: 1.5" id="content-final${post.id}" onclick="show_content(${post.id})">
                    ${content}
                  </div>`
          };
          postHTML +=        
          `<div class="content"style="line-height: 1.5;display:none" id="content-final${post.id}">
            ${content}
          </div></div>`
          if(post.image){
                  postHTML+= 
                `<div class="container overlap-div" id="post-button${post.id}">
                  <div class="text-center">
                      <button class="post-button" id="showMoreButton${post.id}" onclick="showMoreButton(${post.id})">Show More v</button>
                  </div>
                </div>`
          }
          postHTML+=
              `</div>
            </div>`
          
          $('#post-container').append(postHTML)
        }
        offset +=limit
        if(posts.length===0){
          $('#post-loader').show()
          $('#post-loader').html("Please Reload!!!")
          posts_available=false
        }
      },
    })
  }

  $(document).ready(function(){
    LoadPost()
    $(window).scroll(function(){
      if(posts_available){
        let scroo=$(window).height()+$(window).scrollTop()
        console.log($(document).height()+'  '+scroo)
        if($(window).scrollTop()+$(window).height()>=$(document).height()-1){
          
          $('#post-loader').show()
          setTimeout(function(){
            LoadPost()},100)
      }}
    })
  })
