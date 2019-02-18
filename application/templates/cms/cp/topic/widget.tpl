<script type="text/javascript" src="/libraries/jqwidgets/jqx-all.js"></script>
<link href='/libraries/jqwidgets/styles/jqx.base.css' rel='stylesheet' type='text/css'>
<link href='/libraries/jqwidgets/styles/jqx.metro.css' rel='stylesheet' type='text/css'>
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
            'video_id2'=>['Id',0],
            'video_title'=>['Title',1],
            'video_thumb'=>['Thumb',1],
            'video_type'=>['Type',1],
            'video_category'=>['Category',1],
            'video_author'=>['Author',1],
            'video_sourceid'=>['Video Id',0],
            'video_link'=>['Link',0],
            'video_status'=>['Status',1],
            'video_special'=>['Special',1],
            'video_view'=>['View',0],
            'video_insert'=>['Created date',1],
            'video_update'=>['Modified date',0],
            'video_publicday'=>['Pulic date',1]
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
    </div>
</div>
<script>
var _CONFIG = {
	THEME 				: 'metro',
	TYPE 				: '[{$type|default:''}]',
    JQXGRID 			: '#jqwidget-entry-list',
    BINDING_URI 		: base_url + 'cms/vp/video/widgetbinding/',
    EDITPANEL_URI 		: base_url + 'cms/vp/video/editpanel/',
    COMMIT_URI 			: base_url + 'cms/vp/video/onCommit/',
    DELETE_URI 			: base_url + 'cms/vp/video/onDelete/',
	
};
var [{$tplConfig.name}], categoryApp, authorApp;
$(document).ready(function (){
    categoryApp = new oCateApp();
	authorApp = new oAuthorApp()
    [{$tplConfig.name}] = new APP();

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

var oAuthorApp = function() {
	var me = this;
	this.TYPE = '';
	this.BINDING_URI = base_url + 'cms/vp/author/widgetbinding/';
	this._datafields = [
		{name: 'author_id', type: 'int'},
		{name: 'author_name'}
	];
	this._source = {
        datatype			: "json",
        type 				: "POST",
        datafields 			: this._datafields,
        url 				: this.BINDING_URI + this.TYPE,
        id 					:'author_id',
        root 				: 'rows'
    };
    this._dataAdapter = new $.jqx.dataAdapter(this._source, {
    	autoBind: true,
    	beforeLoadComplete: function (records) {
    		for (var i = 0; i < records.length; i++) {
    			records[i].value = records[i].author_id;
    			records[i].label = records[i].author_name;
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
    pendingOn();
    var me = this;
    this._datafields = [
        {name: 'video_id', type: 'int'},
        {name: 'video_title'},
        {name: 'video_thumb'},
        {name: 'video_type'},
        {name: 'video_link'},
        {name: 'video_sourceid'},
        {name: 'video_category',type: 'int'},
		{name: 'video_view',type: 'int'},
		{name: 'video_author',type: 'int'},
		{
			name: 'author_name',type: 'int', value: 'author_id',
			values: { source: authorApp._dataAdapter.records, value: 'author_id', name: 'author_name' } 
		},
        {
            name: 'cat_title',type: 'int', value: 'cat_id',
            values: { source: categoryApp._dataAdapter.records, value: 'cat_id', name: 'cat_title' } 
        },
        // {name: 'author_name',type: 'string'},
        {name: 'video_special',type: 'bool'},
        {name: 'video_status',type: 'bool'},
        {name: 'video_insert', type: 'date'},
        {name: 'video_update', type: 'date'},
        {name: 'video_publicday', type: 'date'},
    ];
    this.toggleSetting = function(){
        $('#jqwidget-entry-setting').toggle();
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
        url: _CONFIG.BINDING_URI + _CONFIG.TYPE,
        id:'video_id',
        root: 'rows',
		filter: function() {
            $(_CONFIG.JQXGRID).jqxGrid('updatebounddata', 'filter');
        },
        sort: function() {
            $(_CONFIG.JQXGRID).jqxGrid('updatebounddata');
        },
    };
    this._dataAdapter = new $.jqx.dataAdapter(me._source, {
        loadError: function(xhr, status, error) {
            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
        }
    });
    this._columns = [
        {
            text: '', dataField: 'video_id', width: 60, filterable: false, sortable: true,editable: false,
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
            text: 'Id'    , dataField: 'video_id2' , displayfield:'video_id',cellsalign: 'right', 
            width: 60, columntype: 'numberinput', filtertype: 'number',
            filterable: true, sortable: true,editable: false,hidden:true
        },{
            text: 'Title', dataField: 'video_title', minWidth: 220, sortable: true,
            columntype: 'textbox', filtertype: 'input',
        },
        {
            text: 'Link', dataField: 'video_link',width: 200, sortable: true,
            columntype: 'textbox', filtertype: 'input', hidden:true
        },
        {
            text: 'Video Id', dataField: 'video_sourceid',width: 100, sortable: true,
            columntype: 'textbox', filtertype: 'input', hidden:true
        },
        {
            text: 'Thumb'     , dataField: 'video_thumb'   ,width:60,
            filterable: false, sortable: false,editable: false,
            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                if(value==undefined || value=='')
                    return '';
                else{

                    return '<img onError="this.src = \'/libraries/images/image_available.gif\'" class="cellthumb" height="32" src="' + value + '"/>';
                }
            }
        },
        {
            text: 'Type'       , dataField: 'video_type' ,
            width: 70, cellsalign: 'left', 
            columntype: 'dropdownlist', 
            filtertype: 'list',
            filterable: true, sortable: true,editable: false
        },
		{
            text: 'Category', width: 120, cellsalign: 'left',
            columntype: 'dropdownlist', filtertype: 'list', 
            datafield: 'video_category',displayfield:'cat_title',
            // filteritems: authorApp._dataAdapter.records, 
            createfilterwidget: function (column, htmlElement, editor) {
                editor.jqxDropDownList({ 
                    source          : categoryApp._dataAdapter.records,
                    displayMember   : "cat_title", 
                    valueMember     : "cat_id"
                });
            },
            createeditor: function(row, cellvalue, editor, cellText, width, height) {
                // construct the editor. 
                editor.jqxDropDownList({
                    source: categoryApp._dataAdapter.records,
                    displayMember: "cat_title", valueMember: "cat_id",
                    width: width, height: height, theme: _CONFIG.THEME,
                    // selectionRenderer: function() {
                    //     return "Please Choose:";
                    // }
                });
            },
            initeditor: function(row, cellvalue, editor, celltext, pressedkey) {
                // set the editor's current value. The callback is called each time the editor is displayed.
                //editor.jqxDropDownList('setContent', celltext); 
                
            },
            geteditorvalue: function(row, cellvalue, editor) {
                // return the editor's value.
                return editor.val();
            }
        },{
        	text: 'Author', width: 120, cellsalign: 'left',
        	columntype: 'dropdownlist', filtertype: 'list', 
        	datafield: 'video_author',displayfield:'author_name',
        	// filteritems: authorApp._dataAdapter.records, 
            createfilterwidget: function (column, htmlElement, editor) {
                editor.jqxDropDownList({ 
                	source 			: authorApp._dataAdapter.records,
                	displayMember	: "author_name", 
                	valueMember		: "author_id"
                });
            },
            createeditor: function(row, cellvalue, editor, cellText, width, height) {
                // construct the editor. 
                editor.jqxDropDownList({
                    source: authorApp._dataAdapter.records,
                    displayMember: "author_name", valueMember: "author_id",
                    width: width, height: height, theme: _CONFIG.THEME,
                    // selectionRenderer: function() {
                    //     return "Please Choose:";
                    // }
                });
            },
            initeditor: function(row, cellvalue, editor, celltext, pressedkey) {
                // set the editor's current value. The callback is called each time the editor is displayed.
                //editor.jqxDropDownList('setContent', celltext); 
                
            },
            geteditorvalue: function(row, cellvalue, editor) {
                // return the editor's value.
                return editor.val();
            }

        },
        // {
        //     text: 'Author'       , dataField: 'author_name' ,
        //     width: 120, cellsalign: 'left', 
        //     columntype: 'textbox', filtertype: 'input',
        //     filterable: true, sortable: true,editable: false
        // }, 
        // {
        //     text: 'Author'       , dataField: 'video_author'    ,
        //     width: 60, cellsalign: 'right', 
        //     filterable: false, sortable: false,editable: true,
        //     columntype: 'numberinput', filtertype: 'number',
        //     validation:function (cell, value) {
        //         if (value < 0 || value > 99) {
        //             return { result: false, message: "Position should be in the 0-99 interval." };
        //         }
        //         return true;
        //     }
        // },    
        {
            text: 'Status'    , dataField: 'video_status' , cellsalign: 'center',
            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
            filterable: true, sortable: true,editable: true
        },{
            text: 'Special'    , dataField: 'video_special' , cellsalign: 'center',
            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
            filterable: true, sortable: true,editable: true
        },{
            text: 'View'    , dataField: 'video_view' , cellsalign: 'right',
            width: 60, columntype: 'numberinput', filtertype: 'number',
            filterable: true, sortable: true,editable: false,hidden:true
        },{
            text: 'Created' , dataField: 'video_insert', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false
        },{
            text: 'Modifield' , dataField: 'video_update', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false, hidden:true
        },{
            text: 'Public Date' , dataField: 'video_publicday', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true, editable: true
        }
    ];
    this._contextMenu = $("#contextMenu").jqxMenu({ 
        width: 200, height: 'auto', autoOpenPopup: false, mode: 'popup',theme: _CONFIG.THEME
    }).on('itemclick', function (event) {
        var $args = $(args);
        var rowIndex = $(_CONFIG.JQXGRID).jqxGrid('getselectedrowindex');
        var rowData = $(_CONFIG.JQXGRID).jqxGrid('getrowdata', rowIndex);
        var action = $args.data('action');
        if(action == 'add'){
            me.onAddItem();
        }else if(action == 'edit'){
            me.onEditItem(rowData.video_id);
        }else if(action == 'delete'){
            me.onDeleteItem(rowData.video_id);
        }else{
            addNotice("Function is updating !");
            console.log(rowData.video_id)
        }
    });
    $(_CONFIG.JQXGRID).jqxGrid({
        width 				: '100%', //autoheight:true,
        height 				: '100%',
        source 				: this._dataAdapter,
        theme 				: _CONFIG.THEME,
        columns 			: this._columns,
        selectionmode 		: 'singlecell',
        editmode 			: 'dblclick',
		filterable 			: true,
        autoshowfiltericon	: true,
        showfilterrow 		: true,
		sortable 			: true,
		virtualmode 		: true,
        // groupable 		: true,
        editable            : true,
        pageable            : true,
        pagesize            : 20,
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
    }).on('contextmenu', function () {
        return false;
    }).on('rowclick', function (event) {
        if (event.args.rightclick) {
            $(_CONFIG.JQXGRID).jqxGrid('selectrow', event.args.rowindex);
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
            return false;
        }
    }).on('filter', function (event) {
    	// get filter information.
        var filterInformation = $(_CONFIG.JQXGRID).jqxGrid('getfilterinformation');
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
        console.log(JSON.stringify(data));

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
            var _data = $(_CONFIG.JQXGRID).jqxGrid('getrowdata', _row);
            var _id = _data.video_id;
            if (_id == undefined || _id == "") {
                return;
            }
            switch (column) {
                case 'video_title':
                    if (_value != _data.video_title && _value!='')
                        me.onCommit(
                        	_CONFIG.COMMIT_URI,
                        	{video_title: _value},
                        	_id
                    	);
                    break;
                case 'video_publicday':
                    if (_value != _data.video_publicday){
                    	var pDate = _value.format('yyyy-mm-dd HH:MM:ss').toString();
                        me.onCommit(
                        	_CONFIG.COMMIT_URI,
                        	{video_publicday: pDate},
                        	_id
                    	);
                    }
                    break;
                case 'video_category':
                    if (_value != _data.video_category)
                        me.onCommit(
                            _CONFIG.COMMIT_URI,
                            {video_category: _value},
                            _id,
                            function(){
                                me.onRefresh();
                                // $(_CONFIG.JQXGRID).jqxGrid('refresh');
                                // $(_CONFIG.JQXGRID).jqxGrid('endcelledit', _row, column, false);
                            }
                        );
                    break;
                case 'video_author':
                    if (_value != _data.video_author)
                        me.onCommit(
                            _CONFIG.COMMIT_URI,
                            {video_author: _value},
                            _id,
                            function(){
                                me.onRefresh();
                                // $(_CONFIG.JQXGRID).jqxGrid('refresh');
                                // $(_CONFIG.JQXGRID).jqxGrid('endcelledit', _row, column, false);
                            }
                        );
                    break;
                case 'video_status':
                    if (_value)
                        me.onCommit(_CONFIG.COMMIT_URI,{video_status: 'true'}, _id);
                    else
                        me.onCommit(_CONFIG.COMMIT_URI,{video_status: 'false'}, _id);
                    break;
                case 'video_special':
                    if (_value)
                        me.onCommit(_CONFIG.COMMIT_URI,{video_special: 'true'}, _id);
                    else
                        me.onCommit(_CONFIG.COMMIT_URI,{video_special: 'false'}, _id);
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
                _CONFIG.EDITPANEL_URI + _CONFIG.TYPE+'/',
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
                        addEditorBasic('[{$tplConfig.prefix}]content',240);
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
        this.onCommit(_oConfig.entryCommitUri,Params,Id,function(rsdata){
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
                    'url': _oConfig.entryDeleteUri,
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
        $(_CONFIG.JQXGRID).jqxGrid('updatebounddata');
    };
	onChangeSource = function(type){
		if(type===_CONFIG.TYPE)return;
        _CONFIG.TYPE=type;
        source.url= _CONFIG.BINDING_URI+_CONFIG.TYPE;
        this.onRefresh();
    };
    $('.setting-column-item input[type=checkbox]').change(function(){
        var column = $(this).data('column');
        if(this.checked){
            $(_CONFIG.JQXGRID).jqxGrid('showcolumn', column);
        }else{
            $(_CONFIG.JQXGRID).jqxGrid('hidecolumn', column);
        }
    });
};
</script>