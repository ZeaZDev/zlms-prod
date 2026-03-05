<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<div class="profile-sidebar">
		<div class="profile-userpic">
			<img src="https://visualpharm.com/assets/314/Admin-595b40b65ba036ed117d36fe.svg" class="img-responsive" alt="">
		</div>
		<div class="profile-usertitle">
			<div class="profile-usertitle-name"><?php //echo $_SESSION['fname_user'].'  '.$_SESSION['lname_user'] ;?></div>
			<div class="profile-usertitle-status">
				<span class="indicator label-success"></span>
				AUTHOR</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">


			<li class="<?php if ($menu=='home') { echo "active"; } ?>">
				<a href="http://edupol.thaidevelopers.cloud/Default.aspx"><em class="fa fa-dashboard">&nbsp;</em> หน้าแรก</a>
			</li>

				<li class="<?php if ($menu=='news') { echo "active"; } ?>">
					<a href="<?php echo site_url('admin/news'); ?>"><em class="fa fa-newspaper-o">&nbsp;</em> สื่อการสอน</a>
				</li>

		</ul>
	</div><!--/.sidebar-->
