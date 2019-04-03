<div class="panel panel-default contact-form">
  <div class="panel-heading">
    <span class="srv-ico ico-5"></span>
    [{$languages.all_counselors|quotes_to_entities}]:<br/>
    Hotline: (+84) 88 606 3577<br/>
    Email: sunwoogroup@gmail.com
  </div>
  <div class="panel-body">
    <form id="advisoryForm" name="advisoryForm" >
      <input type="hidden" name="advisory_type" value="contact">
      <div class="form-group">
        <label for="exampleInputEmail1">[{$languages.all_full_name|quotes_to_entities}]</label>
        <input type="text" class="form-control validate[required]" name="advisory_name" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">[{$languages.all_phone|quotes_to_entities}]</label>
        <input type="text" class="form-control validate[required]" name="advisory_desc" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Email</label>
        <input type="email" class="form-control validate[required,custom[email]]" name="advisory_email" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">[{$languages.all_content|quotes_to_entities}]</label>
        <textarea rows="4" class="form-control validate[required]" name="advisory_content" placeholder=""></textarea>
      </div>
      <div class="form-group-">
        <button type="button" class="btn btn-default btn-sm btn-block btn-primary" onclick="send()">[{$languages.all_submit|quotes_to_entities}]</button>
      </div>
  </form>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function(){

    $('#advisoryForm').validationEngine({
      'scroll': false, 
      'isPopup' : false, 
      prettySelect : true
    //, validateNonVisibleFields:false
    });
  })

  function send(){
    if( $('#advisoryForm').validationEngine('validate') === false)return;
    var params = $('#advisoryForm').serializeObject();
    $.post('/frontend/excution/addAdvisory',
      {
        params : params
      },function(rsdata) {
        alert(rsdata.message);
        if (rsdata.result < 0) {
        } else {
          document.advisoryForm.reset();
        }
      })
    return false;
  }
</script>
