

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h2><b><?php echo $calendar->name_calendar; ?></b></h2>
           <span class="color-text-a">หน่วยสนับสนุนวิชาการรับใช้สังคม มหาวิทยาลัยเชียงใหม่</span>

         <!--  <?php $sum=0; if($news->tag_news !=null){ ?>
            <div class="mt-4">
              <ul class="list-inline">
                <li class="list-inline-item"></li>
                <?php $tags = explode(",", $news->tag_news);?>
                <?php foreach($tags as $tag){ $sum+=1; ?>
                  <?php if ($sum<=5) { ?>
                    <li class="list-inline-item">
                        <a href="<?php echo site_url('news/tag/'.$tag) ?>" class="category-b"><i class="fa fa-tags"></i> <?=$tag?></a>
                    </li>
                  <?php } ?>
                <?php }?>
              </ul>
            </div>

          <?php }?> -->
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="<?php echo site_url('home'); ?>"">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a href="<?php echo site_url('calendar'); ?>"">Calendar</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <?php echo $calendar->name_calendar; ?>
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ News Single Star /-->
<section class="news-single nav-arrow-b">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="">
          <!-- <center>
            <img style="height: 20em;" src="<?php echo base_url();?>assets/img/news/<?php echo $news->img_news ; ?>" alt="" class="img-fluid">
          </center> -->
        </div>
      </div>
      <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-2">
        <div class="post-information">
          <ul class="list-inline text-center color-a">
           <li class="list-inline-item">
            <strong>วันที่ : </strong>
            <span class="color-text-a"><?php echo $calendar->date_calendar; ?></span>
          </li>
        <!--   <li class="list-inline-item mr-2">
            <strong>เข้าชมแล้วทั้งหมด : </strong>
            <span class="color-text-a"><?php echo $news->views_news; ?> ครั้ง</span>
          </li>
          <li class="list-inline-item mr-2">
            <strong>โดย :  </strong>
            <span class="color-text-a">Travel</span>
          </li> -->

        </ul>
      </div>




      <div class="post-content color-text-a">
        <p><?php echo $calendar->detail_calendar; ?></p>
      </div>





    <div class="post-footer">
      <div class="post-share">
        <span>Share: </span>
        <ul class="list-inline socials">
          <li class="list-inline-item">
            <a href="http://www.facebook.com/sharer.php?u=<?php echo $_SERVER['REQUEST_URI'];; ?>" target="_blank">
              <i class="fa fa-facebook" aria-hidden="true"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a href="https://twitter.com/share?url=<?php echo $_SERVER['REQUEST_URI'];; ?>" target="_blank">
              <i class="fa fa-twitter" aria-hidden="true"></i>
            </a>
          </li>
              <!-- <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
              </li> -->
              <li class="list-inline-item">
                <a href="javascript:void((function()%7Bvar%20e=document.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','http://assets.pinterest.com/js/pinmarklet.js?r='+Math.random()*99999999);document.body.appendChild(e)%7D)());" target="_blank">
                  <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!--   <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1">
          <div class="title-box-d">
            <h3 class="title-d">Comments (4)</h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">Emma Stone</h4>
                  <span>18 Sep 2017</span>
                  <p class="comment-description">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                    ipsam temporibus maiores
                    quae natus libero optio, at qui beatae ducimus placeat debitis voluptates amet corporis.
                  </p>
                  <a href="3">Reply</a>
                </div>
              </li>
              <li class="comment-children">
                <div class="comment-avatar">
                  <img src="img/author-1.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">Oliver Colmenares</h4>
                  <span>18 Sep 2017</span>
                  <p class="comment-description">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                    ipsam temporibus maiores
                    quae.
                  </p>
                  <a href="3">Reply</a>
                </div>
              </li>
              <li>
                <div class="comment-avatar">
                  <img src="img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">Emma Stone</h4>
                  <span>18 Sep 2017</span>
                  <p class="comment-description">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                    ipsam temporibus maiores
                    quae natus libero optio.
                  </p>
                  <a href="3">Reply</a>
                </div>
              </li>
            </ul>
          </div>
          <div class="form-comments">
            <div class="title-box-d">
              <h3 class="title-d"> Leave a Reply</h3>
            </div>
            <form class="form-a">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputName">Enter name</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="inputName" placeholder="Name *"
                      required>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputEmail1">Enter email</label>
                    <input type="email" class="form-control form-control-lg form-control-a" id="inputEmail1"
                      placeholder="Email *" required>
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="inputUrl">Enter website</label>
                    <input type="url" class="form-control form-control-lg form-control-a" id="inputUrl" placeholder="Website">
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="textMessage">Enter message</label>
                    <textarea id="textMessage" class="form-control" placeholder="Comment *" name="message" cols="45"
                      rows="8" required></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <button type="submit" class="btn btn-a">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div> -->
      </div>
    </div>
  </section>
  <!--/ News Single End /-->





  <div class="modal fade" id="image-gallery" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header"><?php echo $news->name_news; ?>
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span> </button>
      </div>
      <div class="modal-body">
        <center>
          <img id="image-gallery-image" class="img-responsive"  style="height: 27em;  width: auto;">
        </center>
      </div>
      <div class="modal-footer">
        <button type="button" id="show-previous-image"class="btn btn-secondary"><i class="fa fa-arrow-left"></i></button>
        <button type="button" id="show-next-image" class="btn btn-secondary "><i class="fa fa-arrow-right"></i></button>
      </div>
    </div>
  </div>
</div>