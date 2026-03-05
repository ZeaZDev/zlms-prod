<!-- <script>
    window.onload = function () {
      var chart1 = document.getElementById("line-chart").getContext("2d");
      window.myLine = new Chart(chart1).Line(lineChartData, {
        responsive: true,
        scaleLineColor: "rgba(0,0,0,.2)",
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleFontColor: "#c5c7cc"
      });
    };
  </script> -->

</body>
</html>





<div class="modal fade" id="alert_addsuccess" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <!-- <img src="<?php echo base_url();?>assets/img/logo/logoTOP.png" alt="" width="30"> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="" >
        <center>
          <h3 style="color: green">Succes!</h3>
          <p>บันทึกข้อมูลสำเร็จ</p>
        </center>
      </div>
      <div class="modal-footer" id="" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="ok" >ตกลง</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="alert_adderror" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <!-- <img src="<?php echo base_url();?>assets/img/logo/logoTOP.png" alt="" width="30"> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="" >
        <center>
          <h3 style="color: red">Error!</h3>
          <p>กรุณาตรวจสอบข้อมูลให้ถูกต้อง</p>
        </center>
      </div>
      <div class="modal-footer" id="" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="error" >ตกลง</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="alert_dellimg_error" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <!-- <img src="<?php echo base_url();?>assets/img/logo/logoTOP.png" alt="" width="30"> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="" >
        <center>
          <h3 style="color: red">Error!</h3>
          <p>กรุณาเลือกภาพที่ต้องการลบ</p>
        </center>
      </div>
      <div class="modal-footer" id="" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="error" >ตกลง</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="alert_logout" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <h5 class="modal-title"></h5>
       <!-- <img src="<?php echo base_url();?>assets/img/logoTOP.png" alt="" width="30" > -->
       <div class="title page" style="display: inline;">
        <h4 id="dell" hidden=""></h4>
        <h4 style="display: inline;" id=""></h4>
      </div>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body" id="wrapper" >
      <center>
        <h3>คุณต้องการออกจากระบบหรือไม่ ??</h3>
      </center>
    </div>
    <div class="modal-footer" id="wrapper" >
      <button type="button" class="btn btn-default " data-dismiss="modal" >ไม่ใช่</button>
      <?php echo anchor('admin/operation/logout',"ใช่",array('class'=>'btn btn-primary ')); ?>

    </div>
  </div>
</div>
</div>

<div class="modal fade" id="repass" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <h5 class="modal-title"></h5>
       <!-- <img src="<?php echo base_url();?>assets/img/logoTOP.png" alt="" width="30" > -->
       <div class="title page" style="display: inline;">
        <h4 id="dell" hidden=""></h4>
        <h4 style="display: inline;" id=""></h4>
      </div>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body" id="wrapper" >
      <center>
        <h3 style="color: #0da910">เข้าสู่ระบบสำเร็จ</h3>
        <p>กรุณเปลี่ยนรหัสผ่านใหม่ เมื่อเข้าสู่ระบบครั้งแรก ??</p>
      </center>
    </div>
    <div class="modal-footer" id="wrapper" >
      <button type="button" class="btn btn-default" data-dismiss="modal" id="cioff">ภายหลัง</button>
     <?php echo anchor('admin/operation/pass',"เปลี่ยนรหัสผ่าน",array('class'=>'btn btn-btn btn-success ')); ?>
   </div>
 </div>
</div>
</div>
