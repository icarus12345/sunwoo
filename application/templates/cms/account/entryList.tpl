<script type="text/javascript" src="[{'libraries/cms/account.js'|base_url}]"></script>
[{nocache}]
<script type="text/javascript">
    account_config.entryType = "[{$type|default:''}]";
</script>
[{include file=$smarty.const.APPPATH|cat:"templates/cms/account/rowTmpl.tpl"}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>User Account</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Add new entry" onclick="account.onAddItem()"><i class="fa fa-plus"></i></a></li>
                <li><a href="JavaScript:" title="Refresh entrys" onclick="account.onRefresh()"><i class="fa fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div class="table-overflow">
                <table id="entryDatatable" class="no-table" style="width: 100%">
                    <thead style="display: none;">
                        <tr>
                            <th>Account</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="clear"></div>
            </div>
            <ul class="round-buttons">
                <li>
                    <div class="depth">
                        <a  href="JavaScript:" title="Add new entry" onclick="account.onAddItem()">
                            <i class="fa fa-plus"></i>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="depth">
                        <a  href="JavaScript:" title="Refresh entrys" onclick="account.onRefresh()">
                            <i class="fa fa-rotate-left"></i>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="bs-callout bs-callout-danger">
                <h4>CSS3 Browser support</h4>
                <p>
                    <img src="http://www.w3schools.com/images/compatible_ie2020.gif"/> IE 9+, 
                    <img src="http://www.w3schools.com/images/compatible_firefox2020.gif"/> Firefox, 
                    <img src="http://www.w3schools.com/images/compatible_chrome2020.gif"/> Chrome, 
                    <img src="http://www.w3schools.com/images/precompatible_safari5920.gif"/> Safari
                </p>
            </div>
        </div>
    </div>
</div>
[{/nocache}]