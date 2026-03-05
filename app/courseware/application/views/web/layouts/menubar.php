
<div class="navbar-collapse collapse justify-content-center" id="navbarDefault">

	<button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none pull-right" data-toggle="collapse"
	data-target="#navbarTogglerDemo01" aria-expanded="false">
	<span class="fa fa-user-circle-o" aria-hidden="true"></span>
</button>

<ul class="navbar-nav">
	<li class="nav-item">
		<a class="nav-link <?php if ($menu=='home') { echo 'active'; } ?>" href="<?php echo site_url('home'); ?>">หน้าหลัก</a>
	</li>
	<li class="nav-item">
		<a class="nav-link <?php if ($menu=='news') { echo 'active'; } ?>" href="<?php echo site_url('news'); ?>">ข่าวสาร</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">นวัตกรรม</a>
	</li>

	<li class="nav-item">
		<a class="nav-link <?php if ($menu=='calendar') { echo 'active'; } ?>" href="<?php echo site_url('calendar'); ?>">ปฏิทินกิจกรรม</a>
	</li> 

		<!-- <li class="nav-item">
			<a class="nav-link <?php if ($menu=='about') { echo 'active'; } ?>" href="<?php echo site_url('about'); ?>">เกี่ยวกับเรา</a>
		</li> -->
		<!-- <li class="nav-item">
			<a class="nav-link <?php if ($menu=='contact') { echo 'active'; } ?>" href="<?php echo site_url('contact'); ?>">ติดต่อเรา</a>
		</li> -->
		<li class="nav-item dropdown <?php if ($menu=='contact' or $menu=='about') { echo 'active'; } ?>">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			เกี่ยวกับเรา
		</a>
		<div class="dropdown-menu " aria-labelledby="navbarDropdown">
		<!-- 	<a class="dropdown-item" href="#">Journal</a>
			<a class="dropdown-item" href="#">Document</a>
			<a class="dropdown-item" href="#">Photo</a>
			<a class="dropdown-item" href="#">Video </a>  -->
			<a class="dropdown-item <?php if ($menu=='about') { echo 'active'; } ?>" href="<?php echo site_url('about'); ?>">เกี่ยวกับเรา</a>
			<a class="dropdown-item <?php if ($menu=='contact') { echo 'active'; } ?>" href="<?php echo site_url('contact'); ?>">ติดต่อเรา</a>
		</div>
	</li>

	



</ul>
</div>