 <!--/ Intro Single star /-->
 <section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
           <h1 class="title-single">เกี่ยวกับเรา</h1>
          <span class="color-text-a">หน่วยสนับสนุนวิชาการรับใช้สังคม มหาวิทยาลัยเชียงใหม่</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="<?php echo site_url('home'); ?>">Home</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              About
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ About Star /-->
<section class="section-about">
  <div class="container">
    <div class="row">
      <div class="col-md-12 section-t8">
        <div class="row">
          <div class="col-md-6 col-lg-5">
            <img src="<?php echo base_url();?>assets/img/tem/<?php echo $about->img_about; ?>" alt="" class="img-fluid">
          </div>
          <div class="col-lg-2  d-none d-lg-block">
            <div class="title-vertical d-flex justify-content-start">
              <span><?php echo $about->name1_about; ?></span>
            </div>
          </div>
          <div class="col-md-6 col-lg-5 section-md-t3">
            <div class="title-box-d">
              <h3 class="title-d">
                <span><?php echo $about->name2_about; ?></span>
                <span class="color-d"><span><?php echo $about->name3_about; ?></span></span> 
              </h3>
              </div>
              <p class="color-text-a">
               <?php echo $about->detail_about; ?>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ About End /-->

  <!--/ Team Star /-->
 <!--  <section class="section-agents section-t8">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
              <h2 class="title-a">Meet Our Team</h2>
            </div>
          </div>
        </div>
      </div>
      <div class="row">

        <?php for ($i=0; $i<4; $i++) { ?> 

          <div class="col-md-3">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<?php echo base_url();?>assets/img/tem/agent-4.JPG" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h4 class="title-d">
                      Margaret Sotillo
                      </h4>
                    </div>
                  </div>
                  <div class="card-body-d">
                    <p class="content-d color-text-a">
                      Sed porttitor lectus nibh
                    </p>
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
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            <?php } ?>

          </div>
        </div>
      </section> -->
  <!--/ Team End /-->