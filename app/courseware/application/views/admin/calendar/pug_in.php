<style>
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

#img-upload{
  /* width: 20em;*/
   height: 20em;
}
</style>

<script type="text/javascript">
  $(document).ready( function() {
      $(document).on('change', '.btn-file :file', function() {
    var input = $(this),
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [label]);
    });

    $('.btn-file :file').on('fileselect', function(event, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = label;
        
        if( input.length ) {
            input.val(log);
        } else {
            //if( log ) alert(log);
        }
      
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#img-upload').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function(){
        readURL(this);
    });   
  });
</script>



<script type="text/javascript">
  function previewImages() {
    var $preview = $('#preview').empty();
    if (this.files) $.each(this.files, readAndPreview);
    function readAndPreview(i, file) {
      if (!/\.(jpe?g|png|gif)$/i.test(file.name)){
        return alert(file.name +" is not an image");
    } // else...
    var reader = new FileReader();
    $(reader).on("load", function() {
      $preview.append($("<img/>", {src:this.result, height:100}));
    });
    reader.readAsDataURL(file); 
  }
}
$('#file-input').on("change", previewImages);
</script>






<style type="text/css">
.switch input { 
  display:none;
}
.switch {
  display:inline-block;
  width:60px;
  height:30px;
  margin:8px;
  transform:translateY(50%);
  position:relative;
}

.slider {
  position:absolute;
  top:0;
  bottom:0;
  left:0;
  right:0;
  border-radius:30px;
  box-shadow:0 0 0 2px #777, 0 0 4px #777;
  cursor:pointer;
  border:4px solid transparent;
  overflow:hidden;
  transition:.4s;
}
.slider:before {
  position:absolute;
  content:"";
  width:100%;
  height:100%;
  background:#777;
  border-radius:30px;
  transform:translateX(-30px);
  transition:.4s;
}

input:checked + .slider:before {
  transform:translateX(30px);
  background:#565694;
}
input:checked + .slider {
  box-shadow:0 0 0 2px #777, 0 0 2px limegreen;
}

</style>



<script type="text/javascript">
 $(document).ready(function(){

  $.each($("form").find($("input:file")), function( index, value ) {
    $(value).attr("accept"," image/jpeg, image/png");
  });

});
</script>



