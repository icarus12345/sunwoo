<div class="panel panel-default contact-form">
  <div class="panel-heading">
    <span class="srv-ico ico-5"></span>
    [{$languages.all_counselors|quotes_to_entities}]:<br/>
    Hotline: (+84) 88 606 3577<br/>
    Email: sunwoogroup@gmail.com
  </div>
  <div class="panel-body">
    <form>
      <div class="form-group">
        <label for="exampleInputEmail1">[{$languages.all_full_name|quotes_to_entities}]</label>
        <input type="text" class="form-control" id="" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">[{$languages.all_phone|quotes_to_entities}]</label>
        <input type="text" class="form-control" id="" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Email</label>
        <input type="email" class="form-control" id="" placeholder="">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">[{$languages.all_content|quotes_to_entities}]</label>
        <textarea rows="4" class="form-control" id="" placeholder=""></textarea>
      </div>
      <div class="form-group-">
        <button class="btn btn-default btn-sm btn-block btn-primary">[{$languages.all_submit|quotes_to_entities}]</button>
      </div>
  </form>
  </div>
</div>
