[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Customer</h4>
            [{else}]
            <h4>Customer</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            First name : [{$item->FirstName}]<br/>
            Last name : [{$item->LastName}]<br/>
            Email : [{$item->Email}]<br/>
            Created date : [{$item->Insert}]<br/>
            Modified date : [{$item->Update}]<br/>
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()">
                <i class="fa fa-reply-all"></i>
            </a>
        </div>
    </li>
</ul>
[{/nocache}]