[{assign var="advertise" value=$advertiseBanner[0]}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/co/post/authorApp.tpl"}]


<ul class="jqx-navbar-icons navbar-icons">
    <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onAddItem()"><i class="fa-plus"></i></a></li>
    <li><a href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()"><i class="fa-rotate-left"></i></a></li>
    <li><a href="JavaScript:" title="Setting" onclick="[{$tplConfig.name}].toggleSetting()"><i class="fa-cogs"></i></a></li>
</ul>
<div id='contextMenu' class="jqx-contextMenu">
    <ul>
        <li data-action="add"><i class="fa fa-plus"></i> Add new Record</li>
        <li data-action="edit"><i class="fa fa-pencil-square"></i> Edit Selected Row</li>
        <li data-action="delete"><i class="fa fa-trash-o"></i> Delete Selected Row</li>
        <li data-action="view"><i class="fa fa-eye"></i> View Selected Row</li>
    </ul>
</div>
<div id= "jqwidget-entry-list"></div>
<div id= "jqwidget-entry-setting" class="jqwidget-entry-setting">
    <div class="mark" onclick="[{$tplConfig.name}].toggleSetting()"></div>
    <div>
        <div><i class="fa-cogs"></i> Setting</div>
        <div>
            
            [{assign var="columns" value=[
            'story_id2'=>['Id',0],
            'story_title'=>['Title',1],
            'story_thumb'=>['Thumb',0],
            'story_status'=>['Status',1],
            'story_view'=>['View',0],
            'story_insert'=>['Created date',1],
            'story_update'=>['Modified date',0],
            'story_publicday'=>['Pulic date',1]
            ]}]
            <fieldset>
                <legend>Show/Hide Columns</legend>
            [{foreach from=$columns item=o key=k}]
            <div class="setting-column-item">
                <span class="squaredThree">
                    <input type="checkbox"  
                        id="squaredThreeToggle[{$k}]" 
                        data-column="[{$k}]"
                        [{if $o[1]}]checked[{/if}]
                        >
                    <label for="squaredThreeToggle[{$k}]"></label>
                </span>
                <label for="squaredThreeToggle[{$k}]" style="font-weight:normal">[{$o[0]}]&nbsp;&nbsp;</label>
            </div>
            [{/foreach}]
            </fieldset>
            
        </div>
        <div>
            
        </div>
    </div>
</div>
<script type="text/javascript">

var _CONFIG = {
	THEME 				: 'metro',
	TYPE 				: '[{$type|default:''}]',
    JQXGRID 			: '#jqwidget-entry-list',
    BINDING_URI 		: base_url + 'cms/co/story/widgetbinding/',
    EDITPANEL_URI 		: base_url + 'cms/co/story/editpanel/',
    COMMIT_URI 			: base_url + 'cms/co/story/onCommit/',
    DELETE_URI 			: base_url + 'cms/co/story/onDelete/',
	
};
var [{$tplConfig.name}], categoryApp, authorApp, topicApp;
$(document).ready(function (){

    // topicApp = new oTopicApp();
    categoryApp = new oCateApp();
	authorApp = new oAuthorApp()
    [{$tplConfig.name}] = new APP();
    [{if $smarty.get.action=='add'}]
        setTimeout(function(){
            [{$tplConfig.name}].onAddItem();
        },1500);
    [{/if}]
});
var oCateApp = function() {
    var me = this;
    this.TYPE = 'video';
    this.BINDING_URI = base_url + 'cms/cp/cate/widgetbinding/';
    this._datafields = [
        {name: 'cat_id', type: 'int'},
        {name: 'cat_title'}
    ];
    this._source = {
        datatype            : "json",
        type                : "POST",
        datafields          : this._datafields,
        url                 : this.BINDING_URI + this.TYPE,
        id                  :'cate_id',
        root                : 'rows'
    };
    this._dataAdapter = new $.jqx.dataAdapter(this._source, {
        autoBind: true,
        beforeLoadComplete: function (records) {
            for (var i = 0; i < records.length; i++) {
                records[i].value = records[i].cat_id;
                records[i].label = records[i].cat_title;
            }
        },
        loadError: function(xhr, status, error) {
            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
        }
    });
    this._columns = [
        
    ];
    return this;
};


var APP = function() {
    this.jqxgrid = '#jqwidget-entry-list';
    this.theme = 'metro',
    this.type = '[{$type|default:''}]';
    this.bindingUri = base_url + 'cms/co/story/widgetbinding/';
    this.editPanelUri = base_url + 'cms/co/story/editpanel/';
    this.entryCommitUri = base_url + 'cms/co/story/onCommit/';
    this.entryDeleteUri = base_url + 'cms/co/story/onDelete/';
    pendingOn();
    var me = this;
    this._datafields = [
        {name: 'story_id', type: 'int'},
        {name: 'story_title'},
        // {name: 'story_thumb'},
        // {name: 'author_name'},
        {name: 'topic_title'},
        {name: 'story_topic',type: 'int'},
		{name: 'story_view',type: 'int'},
        {name: 'story_status',type: 'bool'},
        {name: 'story_insert', type: 'date'},
        {name: 'story_update', type: 'date'},
        {name: 'story_publicday', type: 'date'},
    ];
    this.toggleSetting = function(){
        $('#jqwidget-entry-setting').toggle();
        topicApp.init();
        // authorApp.init();
    };
    this.onCommit = function(Url,Params, Id,callback) {
        httpRequest({
            'url': Url,
            'data': {
                'Id': Id,
                'Params': Params
            },
            'callback': function(rsdata) {
                if (rsdata.result < 0) {
                    addNotice(rsdata.message,'danger');
                } else {
                    addNotice(rsdata.message,'info');
                    if (typeof callback == 'function') {
                        callback(rsdata);
                    }
                }
            }
        }).call();
    };
    this._source = {
        datatype: "json",
        type: "POST",
        datafields: me._datafields,
        url: me.bindingUri + me.type,
        id:'story_id',
        root: 'rows',
		filter: function() {
            $(me.jqxgrid).jqxGrid('updatebounddata', 'filter');
        },
        sort: function() {
            $(me.jqxgrid).jqxGrid('updatebounddata');
        },
    };
    this._dataAdapter = new $.jqx.dataAdapter(me._source, {
        loadError: function(xhr, status, error) {
            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
        }
    });
    this._columns = [
        {
            text: '', dataField: 'story_id', width: 60, filterable: false, sortable: true,editable: false,
            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                var str = "";
                if (value && value > 0) {
                    try {
                        str += "<a href='JavaScript:void(0)'"+
                        "style='margin: 5px; float: left;' " +
                        "onclick=\"[{$tplConfig.name}].onEditItem(" + value + ");\" "+ 
                        "title='Edit :" + value + "'><i class=\"fa fa-pencil-square\"></i></a>\
                        ";
                        str += "\
                            <a href='JavaScript:void(0)' style='margin: 5px; float: left;' onclick=\"[{$tplConfig.name}].onDeleteItem(" + value + ");\" title='Delete :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
                        ";
                    } catch (e) {
                    }
                }
                
                return str;
            }
        },{
            text: 'Id'    , dataField: 'story_id2' , displayfield:'story_id',cellsalign: 'right', 
            width: 60, columntype: 'numberinput', filtertype: 'number',
            filterable: false, sortable: false,editable: false,hidden:true
        // },{
        //     text: 'Author', width: 120, cellsalign: 'left',
        //     columntype: 'dropdownlist', filtertype: 'list', 
        //     datafield: 'author_name',
        //     editable: false,
        //     filteritems: authorApp._dataAdapter.records, 
        //     createfilterwidget: function (column, htmlElement, editor) {
        //         editor.jqxDropDownList({ 
        //             source          : authorApp._dataAdapter.records,
        //             displayMember   : "author_name", 
        //             valueMember     : "author_id"
        //         });
        //     }
        // },{
        //     text: 'Topic', dataField: 'topic_title', width: 120, sortable: true,
        //     columntype: 'textbox', filtertype: 'textbox', filtercondition: 'CONTAINS',
        
        },{
            text: 'Title', dataField: 'story_title', minWidth: 220, sortable: true,
            columntype: 'textbox', filtertype: 'textbox', filtercondition: 'CONTAINS',
        },{
            text: 'Thumb'     , dataField: 'story_thumb'   ,width:60,
            filterable: false, sortable: false,editable: false,hidden:true,
            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                if(value==undefined || value=='')
                    return '';
                else{

                    return '<img onError="this.src = \'/libraries/images/image_available.gif\'" class="cellthumb" height="32" src="' + value + '"/>';
                }
            }
        },{
            text: 'Status'    , dataField: 'story_status' , cellsalign: 'center',
            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
            filterable: true, sortable: true,editable: true
        },{
            text: 'View'    , dataField: 'story_view' , cellsalign: 'right',
            width: 60, columntype: 'numberinput', filtertype: 'number',
            filterable: true, sortable: true,editable: false,hidden:true
        },{
            text: 'Created' , dataField: 'story_insert', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false
        },{
            text: 'Modifield' , dataField: 'story_update', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false, hidden:true
        },{
            text: 'Public Date' , dataField: 'story_publicday', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true, editable: true
        }
    ];
    this._contextMenu = $("#contextMenu").jqxMenu({ 
        width: 200, height: 'auto', autoOpenPopup: false, mode: 'popup',theme: me.theme
    }).on('itemclick', function (event) {
        var $args = $(args);
        console.log(event.args.rowindex)
        var rowIndex = $(me.jqxgrid).jqxGrid('getselectedrowindex');
        if(rowIndex>=0){
            var rowData = $(me.jqxgrid).jqxGrid('getrowdata', rowIndex);
            if(rowData){
                var action = $args.data('action');
                if(action == 'add'){
                    me.onAddItem();
                }else if(action == 'edit'){
                    me.onEditItem(rowData.story_id);
                }else if(action == 'delete'){
                    me.onDeleteItem(rowData.story_id);
                }else{
                    addNotice("Function is updating !");
                    console.log(rowData.story_id)
                }
            }
        }
    });
    $(me.jqxgrid).jqxGrid({
        width 				: '100%', //autoheight:true,
        height 				: '100%',
        source 				: this._dataAdapter,
        theme 				: me.theme,
        columns 			: this._columns,
        selectionmode 		: 'singlecell',
        editmode 			: 'dblclick',
		filterable 			: true,
        autoshowfiltericon	: true,
        showfilterrow 		: true,
		sortable 			: true,
		virtualmode 		: true,
        //groupable 		    : true,
        //groups              : ['author_name','topic_title'],
        editable            : true,
        pageable            : true,
        pagesize            : 100,
        pagesizeoptions     : [20,100, 200, 500, 1000],
        rendergridrows 		: function(){ 
            return me._dataAdapter.records; 
        },
        ready: function(){
            pendingOff();
        },
        handlekeyboardnavigation: function(event)
        {
            var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
            if (key == 27) {
                me._cancel=true;
            }
        },
    }).on("bindingcomplete", function (event) {
        $(me.jqxgrid).jqxGrid('expandallgroups');
    }).on('contextmenu', function () {
        return false;
    }).on('rowclick', function (event) {
        var rowIndex = event.args.rowindex;
        if(rowIndex>=0){
            if (event.args.rightclick) {
                $(me.jqxgrid).jqxGrid('selectrow', event.args.rowindex);
                var scrollTop = $(window).scrollTop();
                var scrollLeft = $(window).scrollLeft();
                var menuWidth = me._contextMenu.width();
                var menuHeight = me._contextMenu.height();
                var x = parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft;
                var y = parseInt(event.args.originalEvent.clientY) + 5 + scrollTop;
                var windowWidth = $(window).width();
                var windowHeight = $(window).height();
                if( x + menuWidth > windowWidth){
                    x = windowWidth - menuWidth -4;
                }
                if( y + menuHeight > $(window).height()){
                    y = windowHeight - menuHeight -4;
                }
                me._contextMenu.jqxMenu('open', x, y);
            }
        }
        return false;
    }).on('filter', function (event) {
    	// get filter information.
        var filterInformation = $(me.jqxgrid).jqxGrid('getfilterinformation');
        var filterdata = {};
        var filterslength = 0;
        var data = {};
        for (var x = 0; x < filterInformation.length; x++) {
            // column's data field.
            var filterdatafield = filterInformation[x].datafield;
            // column's filter group.
            var filterGroup = filterInformation[x].filter;
            // column's filters.
            var filters = filterGroup.getfilters();
            // filter group's operator.
            data[filterdatafield + "operator"] = filterGroup.operator;
            for (var m = 0; m < filters.length; m++) {
                filters[m].datafield = filterdatafield;
                // filter's value.
                var filtervalue = filters[m].value;
                data["filtervalue" + filterslength] = filtervalue.toString();
                // filter's id.
                if (filters[m].id) {
                    data["filterid" + filterslength] = filters[m].id.toString();
                }
                // filter's condition.
                data["filtercondition" + filterslength] = filters[m].condition;
                // filter's operator.
                data["filteroperator" + filterslength] = filters[m].operator;
                // filter's data field.
                data["filterdatafield" + filterslength] = filterdatafield;
                filterslength++;
            }
        }

    }).bind('cellbeginedit', function (event) {
        me._cancel = false;
    }).bind('cellendedit', function (event) {
        [{if $unit|strpos:".e."===false}]return;[{/if}]
        if(me._cancel) return;
        try{
            var args = event.args;
            var column = args.datafield, 
            	_row = args.rowindex, 
            	_value = args.value;
            var _data = $(me.jqxgrid).jqxGrid('getrowdata', _row);
            var _id = _data.story_id;
            if (_id == undefined || _id == "") {
                return;
            }
            var updateCell = function(){
                // $(me.jqxgrid).jqxGrid('setcellvalue', _row, column, _value);
            };
            switch (column) {
                case 'story_title':
                    if (_value != _data.story_title && _value!='')
                        me.onCommit(
                        	me.entryCommitUri,
                        	{story_title: _value},
                        	_id, updateCell
                    	);
                    break;
                case 'story_publicday':
                    if (_value != _data.story_publicday){
                    	var pDate = _value.format('yyyy-mm-dd HH:MM:ss').toString();
                        me.onCommit(
                        	me.entryCommitUri,
                        	{story_publicday: pDate},
                        	_id, updateCell
                    	);
                    }
                    break;
                case 'story_status':
                    if (_value)
                        me.onCommit(
                            me.entryCommitUri,{story_status: 'true'}, _id, updateCell
                        );
                    else
                        me.onCommit(
                            me.entryCommitUri,{story_status: 'false'}, _id, updateCell
                        );
                    break;
                default:
                    addNotice("Column editable is dont support !");
                    console.log(_value)
            }
        } catch (e) {
            addNotice(e.message, 'danger');
        }
    });
    this.onInit = function(){
            
    };
    this.onAddItem = function(){
        [{if $unit|strpos:".a."===false}]return;[{/if}]
        this.onEditItem(0);
    };
    this.onEditItem = function(Id){
        [{if $unit|strpos:".e."===false}]return;[{/if}]
        if (pending > 0)return;
        $('body').addClass('is-entry');
        $('#entry-container').html('...');
        httpRequest({
            'url'         :   
                me.editPanelUri + me.type+'/',
            'data'        :   {
                'Id'  :   Id
            },
            'callback'    :   function(rsdata){
                if(rsdata.result<0){
                    $('body').removeClass('is-entry');
                    addNotice(rsdata.message,'danger');
                }else{
                    $('#entry-container').html(rsdata.htmlreponse);
                    if($('#[{$tplConfig.prefix}]content').length==1)
                        addEditorFeature('[{$tplConfig.prefix}]content',240);
                    $('#entryForm .selectpicker').selectpicker();
                    $('#entryForm').validationEngine({
                        'scroll': false
                        , prettySelect : true
                        //, validateNonVisibleFields:false
                    }); 
                    $('#entryForm .date').datetimepicker({
                        'pickDate': true,
                        'pickTime': true   ,
                        'dayOfWeekStart': 1
                    });
                }
            }
        }).call();
    };
    this.onSave = function(){
        if($('#[{$tplConfig.prefix}]content').length==1)
            $('#[{$tplConfig.prefix}]content').val(CKEDITOR.instances['[{$tplConfig.prefix}]content'].getData());
        if( $('#entryForm').validationEngine('validate') === false){
            addNotice('Please complete required input.','info');
            return;
        }
        var Id = $('#EntryId').val();
        var Params =$('#entryForm').serializeObject();
        // var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
        // Params.[{$tplConfig.prefix}]images = images.get().join('\r\n');
        this.onCommit(me.entryCommitUri,Params,Id,function(rsdata){
            if(rsdata.result<0){
                addNotice(rsdata.message,'danger');
            }else{
                me.onRefresh();
                me.onCancel();
            }
        });
    };
    this.onCancel = function(){
        $('body').removeClass('is-entry');
    };
    this.onDeleteItem = function(Id){
        [{if $unit|strpos:".d."===false}]return;[{/if}]
        ConfirmMsg(
            'Delete item ?',
            'These items will be permanently deleted and cannot be recovered. Are you sure ?',
            function(){
                httpRequest({
                    'url': me.entryDeleteUri,
                    'data': {
                        'Id': Id
                    },
                    'callback': function(rsdata) {
                        if (rsdata.result < 0) {
                            addNotice(rsdata.message,'danger');
                        } else {
                            addNotice(rsdata.message,'info');
                            me.onRefresh();
                        }
                    }
                }).call();
            }
        );
    };
    this.onRefresh = function(){
        $(me.jqxgrid).jqxGrid('updatebounddata');
    };
	this.onChangeSource = function(type){
		if(type===me.type)return;
        me.type=type;
        source.url= me.bindingUri+me.type;
        this.onRefresh();
    };
    this.addFilter = function(datafield, filtervalue){
        var filtergroup = new $.jqx.filter(),
            filtertype = 'numericfilter',
            condition = 'EQUAL',
            operator = 0,
            filter = filtergroup.createfilter(filtertype, filtervalue, condition);
        filtergroup.addfilter(operator, filter);
        $(me.jqxgrid).jqxGrid('addfilter', datafield, filtergroup);
        $(me.jqxgrid).jqxGrid('applyfilters');
    }
    $('.setting-column-item input[type=checkbox]').change(function(){
        var column = $(this).data('column');
        if(this.checked){
            $(me.jqxgrid).jqxGrid('showcolumn', column);
        }else{
            $(me.jqxgrid).jqxGrid('hidecolumn', column);
        }
    });
};
</script>