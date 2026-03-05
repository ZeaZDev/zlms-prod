<!--/ footer Star /-->
<section class="section-footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-4">
        <div class="widget-a">
          <div class="w-header-a">
            <h3 class="w-title-a text-brand">CMU SE</h3>
          </div>
          <div class="w-body-a">
            <p class="w-text-a color-text-a">
              หน่วยสนับสนุนวิชาการรับใช้สังคมมหาวิทยาลัยเชียงใหม่
            </p>
            <p>มหาวิทยาลัยเชียงใหม่ <br> 239 ถนนห้วยแก้ว ต.สุเทพ อ.เมือง จ.เชียงใหม่ 50200 </p>
          </div>
          <div class="w-footer-a">
            <ul class="list-unstyled">
            </ul>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-md-4 section-md-t3">
        <div class="widget-a">
          <div class="w-header-a">
            <h3 class="w-title-a text-brand">หน่วยงานที่เกี่ยวข้อง</h3>
          </div>
          <div class="w-body-a">
            <div class="w-body-a">
              <ul class="list-unstyled">
                <li class="item-list-a">
                  <?php if ($footer != null) { ?>
                   <?php foreach($footer as $c)
                   if ($c->type_footer==1) { { ?>

                    <i class="fa fa-angle-right"></i> 
                    <a href=" <?php echo $c->url_footer ; ?>" target="_blank">
                      <?php echo $c->name_footer ; ?></a><br>

                    <?php } } ?>
                  <?php } ?>

                </li>

              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-md-4 section-md-t3">
        <div class="widget-a">
          <div class="w-header-a">
            <h3 class="w-title-a text-brand">นวัตกรรม</h3>
          </div>
          <div class="w-body-a">
            <ul class="list-unstyled">
              <li class="item-list-a">
                <?php if ($footer != null) { ?>
                 <?php foreach($footer as $c)
                 if ($c->type_footer==2) { { ?>

                  <i class="fa fa-angle-right"></i> 
                  <a href=" <?php echo $c->url_footer ; ?>" target="_blank">
                    <?php echo $c->name_footer ; ?></a><br>

                  <?php } } ?>
                <?php } ?>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="copyright-footer">
          <p class="copyright color-text-a">
            &copy; Copyright
            <span class="color-a">Societal Engagement CMU.</span> All Rights Reserved.
          </p>
        </div>
      </div>
    </div>
  </div>
</footer>
<!--/ Footer End /-->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<div id="preloader"></div>



<!-- Template Main Javascript File -->
<script src="<?php echo base_url('assets/web/js/main.js'); ?>"></script>

</body>
</html>


