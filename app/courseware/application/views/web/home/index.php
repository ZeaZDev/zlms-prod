
<!--/ Carousel Star /-->
<div class="intro intro-carousel">

  <div id="carousel" class="owl-carousel owl-theme">

    <?php if ($slideshow != null) { ?>
     <?php foreach($slideshow as $c) { ?>
      <a href="<?php echo $c->url_slideshow ; ?>" target="_blank">
        <img class="carousel-item-a " src="<?php echo base_url();?>assets/img/slideshow/<?php echo $c->img_slideshow ; ?>" title="<?php echo $c->name_slideshow ; ?>"  />
      </a>
    <?php } ?>
  <?php } ?>

</div>
</div>
<!--/ Carousel end /-->

<!--/ Services Star /-->
<section class="section-services section-t8">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="title-wrap d-flex justify-content-between">
          <div class="title-box">
            <h2 class="title-a">สนับสนุนวิชาการรับใช้สังคม</h2>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4">
        <div class="card-box-c foo">
          <div class="card-header-c d-flex">
            <div class="card-box-ico">
              <span class="fa fa-pie-chart"></span>
            </div>
            <div class="card-title-c align-self-center">
              <h2 class="title-c">งานวิจัย</h2>
            </div>
          </div>
          <div class="card-body-c">
            <p class="content-c">
              Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Praesent sapien massa,
              convallis a pellentesque
              nec, egestas non nisi.
            </p>
          </div>
          <div class="card-footer-c">
            <!-- <a href="#" class="link-c link-icon">Read more
              <span class="ion-ios-arrow-forward"></span>
            </a> -->
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card-box-c foo">
          <div class="card-header-c d-flex">
            <div class="card-box-ico">
              <span class="fa fa-file-text"></span>
            </div>
            <div class="card-title-c align-self-center">
              <h2 class="title-c">บริการวิชาการ</h2>
            </div>
          </div>
          <div class="card-body-c">
            <p class="content-c">
              Nulla porttitor accumsan tincidunt. Curabitur aliquet quam id dui posuere blandit. Mauris blandit
              aliquet elit, eget tincidunt
              nibh pulvinar a.
            </p>
          </div>
          <div class="card-footer-c">
           <!--  <a href="#" class="link-c link-icon">Read more
              <span class="ion-ios-arrow-forward"></span>
            </a> -->
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card-box-c foo">
          <div class="card-header-c d-flex">
            <div class="card-box-ico">
              <span class="fa fa-home"></span>
            </div>
            <div class="card-title-c align-self-center">
              <h3 class="title-c">เพื่อท้องถิ่น</h3>
            </div>
          </div>
          <div class="card-body-c">
            <p class="content-c">
              Sed porttitor lectus nibh. Cras ultricies ligula sed magna dictum porta. Praesent sapien massa,
              convallis a pellentesque
              nec, egestas non nisi.
            </p>
          </div>
          <div class="card-footer-c">
           <!--  <a href="#" class="link-c link-icon">Read more
              <span class="ion-ios-arrow-forward"></span>
            </a> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ Services End /-->



<!--/ News Star /-->
<section class="section-news section-t8">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="title-wrap d-flex justify-content-between">
          <div class="title-box">
            <h2 class="title-a">ข่าวสาร</h2>
          </div>
          <div class="title-link">
            <a href="<?php echo site_url('news'); ?>">ข่าวสาร ทั้งหมด
              <span class="ion-ios-arrow-forward"></span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div id="new-carousel" class="owl-carousel owl-theme">

      <?php if ($news != null) { ?>
        <?php foreach($news as $c) { ?>

          <div class="carousel-item-c">
            <div class="card-box-b card-shadow news-box">
             <div class="" style="height: 25em;">
              <img src="<?php echo base_url();?>assets/img/news/<?php echo $c->img_news ; ?>" alt="" class="img-b img-fluid">
            </div>
            <div class="card-overlay">
              <div class="card-header-b">
                <div class="card-category-b">

                  <div class="mt-4">
                    <ul class="list-inline">
                      <?php $sum=0; if($c->tag_news !=null){ ?>
                        <?php $tags = explode(",", $c->tag_news);?>
                        <?php foreach($tags as $tag){ $sum+=1; ?>
                          <?php if ($sum<=3) { ?>
                            <li class="list-inline-item">
                              <a href="<?php echo site_url('news/tag/'.$tag) ?>" class="category-b"><i class="fa fa-tags"></i> <?=$tag?></a>
                            </li>
                          <?php } ?>
                        <?php }?>
                      <?php }?>
                    </ul>
                  </div>


                </div>
                <div class="card-title-b">
                 <h2 class="title-2">
                  <a href="<?php echo site_url('news/view/'.$c->id_news)?>"><?php echo $c->name_news ; ?></a>
                </h2>
              </div>
              <div class="card-date">
                <span class="date-b"><?php echo $c->date_news ; ?></span>
              </div>
            </div>
          </div>
        </div>
      </div>

    <?php } ?>
  <?php } ?>


</div>
</div>
</section>
<!--/ News End /-->


<!--/ Property Star /-->
<section class="section-property section-t8">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="title-wrap d-flex justify-content-between">
          <div class="title-box">
            <h2 class="title-a">นวัตกรรม </h2>
          </div>
          <div class="title-link">
            <a href="">นวัตกรรม ทั้งหมด
              <span class="ion-ios-arrow-forward"></span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div id="property-carousel" class="owl-carousel owl-theme">

     <div class="carousel-item-b">
      <div class="card-box-a card-shadow">
        <div class="img-box-a">
          <img src="<?php echo base_url();?>assets/web/img/property-3.jpg"  alt="" class="img-a img-fluid">
        </div>
        <div class="card-overlay">
          <div class="card-overlay-a-content">
            <div class="card-header-a">
              <h2 class="card-title-a">
                <a href="property-single.html">Central Park</a>
              </h2>
            </div>
            <div class="card-body-a">
              <div class="price-box d-flex">
                <span class="price-a">download</span>
              </div>
              <a href="property-single.html" class="link-a">Click here to view
                <span class="ion-ios-arrow-forward"></span>
              </a>
            </div>
            <div class="card-footer-a">
              <ul class="card-info d-flex justify-content-around">

                <li>
                  <h4 class="card-info-title">view</h4>
                  <span>22</span>
                </li>
                <li>
                  <h4 class="card-info-title">download</h4>
                  <span>4</span>
                </li>
                <li>
                  <h4 class="card-info-title">share</h4>
                  <span>1</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>


  </div>
</div>
</section>
<!--/ Property End /-->

<!--/ Agents Star /-->
  <!--/
<section class="section-agents section-t8">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
              <h2 class="title-a">Best Agents</h2>
            </div>
            <div class="title-link">
              <a href="agents-grid.html">All Agents
                <span class="ion-ios-arrow-forward"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="img/agent-4.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
              <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <a href="agent-single.html" class="link-two">Margaret Sotillo
                      <br> Escala</a>
                  </h3>
                </div>
              </div>
              <div class="card-body-d">
                <p class="content-d color-text-a">
                  Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                </p>
                <div class="info-agents color-a">
                  <p>
                    <strong>Phone: </strong> +54 356 945234</p>
                  <p>
                    <strong>Email: </strong> agents@example.com</p>
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">
                  <ul class="list-inline">
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-facebook" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="img/agent-1.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
              <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <a href="agent-single.html" class="link-two">Stiven Spilver
                      <br> Darw</a>
                  </h3>
                </div>
              </div>
              <div class="card-body-d">
                <p class="content-d color-text-a">
                  Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                </p>
                <div class="info-agents color-a">
                  <p>
                    <strong>Phone: </strong> +54 356 945234</p>
                  <p>
                    <strong>Email: </strong> agents@example.com</p>
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">
                  <ul class="list-inline">
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-facebook" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="img/agent-5.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
              <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <a href="agent-single.html" class="link-two">Emma Toledo
                      <br> Cascada</a>
                  </h3>
                </div>
              </div>
              <div class="card-body-d">
                <p class="content-d color-text-a">
                  Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
                </p>
                <div class="info-agents color-a">
                  <p>
                    <strong>Phone: </strong> +54 356 945234</p>
                  <p>
                    <strong>Email: </strong> agents@example.com</p>
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">
                  <ul class="list-inline">
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-facebook" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one">
                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> /-->
  <!--/ Agents End /-->


  <!--/ Testimonials Star /-->
  <!-- <section class="section-testimonials section-t8 nav-arrow-a">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
              <h2 class="title-a">Testimonials</h2>
            </div>
          </div>
        </div>
      </div>
      <div id="testimonial-carousel" class="owl-carousel owl-arrow">
        <div class="carousel-item-a">
          <div class="testimonials-box">
            <div class="row">
              <div class="col-sm-12 col-md-6">
                <div class="testimonial-img">
                  <img src="img/testimonial-1.jpg" alt="" class="img-fluid">
                </div>
              </div>
              <div class="col-sm-12 col-md-6">
                <div class="testimonial-ico">
                  <span class="ion-ios-quote"></span>
                </div>
                <div class="testimonials-content">
                  <p class="testimonial-text">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, cupiditate ea nam praesentium
                    debitis hic ber quibusdam
                    voluptatibus officia expedita corpori.
                  </p>
                </div>
                <div class="testimonial-author-box">
                  <img src="img/mini-testimonial-1.jpg" alt="" class="testimonial-avatar">
                  <h5 class="testimonial-author">Albert & Erika</h5>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item-a">
          <div class="testimonials-box">
            <div class="row">
              <div class="col-sm-12 col-md-6">
                <div class="testimonial-img">
                  <img src="img/testimonial-2.jpg" alt="" class="img-fluid">
                </div>
              </div>
              <div class="col-sm-12 col-md-6">
                <div class="testimonial-ico">
                  <span class="ion-ios-quote"></span>
                </div>
                <div class="testimonials-content">
                  <p class="testimonial-text">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, cupiditate ea nam praesentium
                    debitis hic ber quibusdam
                    voluptatibus officia expedita corpori.
                  </p>
                </div>
                <div class="testimonial-author-box">
                  <img src="img/mini-testimonial-2.jpg" alt="" class="testimonial-avatar">
                  <h5 class="testimonial-author">Pablo & Emma</h5>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->
  <!--/ Testimonials End /-->

 

