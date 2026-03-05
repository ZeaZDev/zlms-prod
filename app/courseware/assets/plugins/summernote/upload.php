<!DOCTYPE html>
<html lang="en">
<head>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="dist/summernote.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="dist/summernote.min.js"></script>
</head>
<body>
	<div id="summernote"></div>
	<button id="btn1">Done.</button>
	<script>
		$(document).ready(function() {
			
			$('#summernote').summernote({
				height: 300,
				focus: true,
				callbacks: {
					onImageUpload : function(files, editor, welEditable) {

						 for(var i = files.length - 1; i >= 0; i--) {
								 sendFile(files[i], this);
						}
					}
				}
			});
			
			$("#btn1").on("click",function(){
				var markupStr = $('#summernote').summernote('code');
				//$("#tmp").html(markupStr);
				//$("#tmp").css("display","block");
				alert(markupStr);
			});

			function sendFile(file, el) {
				var form_data = new FormData();
				form_data.append('file', file);
				$.ajax({
					data: form_data,
					type: "POST",
					url: 'save.php',
					cache: false,
					contentType: false,
					processData: false,
					success: function(url) {
						$(el).summernote('editor.insertImage', url);
					}
				});
			}
			
		});
	</script>
</body>
</html>