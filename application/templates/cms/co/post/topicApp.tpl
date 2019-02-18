<script type="text/javascript">
var oTopicApp = function(){
    var me = this;
    this.TYPE = 'daily';
    this.BINDING_URI = base_url + 'cms/co/topic/widgetbinding/';
    this.EDITPANEL_URI = base_url + 'cms/co/topic/editpanel/';
    this.entryCommitUri = base_url + 'cms/co/topic/onCommit/';
    this.ENTRYTYPE = 'daily';
    this._datafields = [
        {name: 'topic_id', type: 'int'},
        {name: 'topic_title'},
        {name: 'topic_author', type: 'int'},
        {name: 'author_name'},
        {name: 'topic_status',type: 'bool'},
        {name: 'topic_insert', type: 'date'},
        {name: 'topic_update', type: 'date'},
    ];
    this._source = {
        datatype            : "json",
        type                : "POST",
        datafields          : this._datafields,
        url                 : this.BINDING_URI + this.TYPE,
        id                  :'topic_id',
        root                : 'rows',
        filter: function() {
            $(me.jqxgrid).jqxGrid('updatebounddata', 'filter');
        },
        sort: function() {
            $(me.jqxgrid).jqxGrid('updatebounddata');
        },
    };
    this._dataAdapter = new $.jqx.dataAdapter(this._source, {
        // autoBind: true,
        beforeLoadComplete: function (records) {
            for (var i = 0; i < records.length; i++) {
                records[i].value = records[i].topic_id;
                records[i].label = records[i].topic_title;
            }
        },
        loadError: function(xhr, status, error) {
            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
        }
    });
    this._columns = [
        {
            text: '', dataField: 'topic_id', width: 48, filterable: false, sortable: true,editable: false,
            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                var str = "";
                if (value && value > 0) {
                    try {
                        str += "<a href='JavaScript:void(0)'"+
                        "style='margin: 5px; float: left;' " +
                        "onclick=\"topicApp.onEditItem(" + value + ");\" "+ 
                        "title='Edit :" + value + "'><i class=\"fa fa-pencil-square\"></i></a>\
                        ";
                        str += "\
                            <a href='JavaScript:void(0)' style='margin: 5px; float: left;' onclick=\"topicApp.onDeleteItem(" + value + ");\" title='Delete :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
                        ";
                    } catch (e) {
                    }
                }
                
                return str;
            }
        },{
            text: 'Author', dataField: 'author_name', width: 120, sortable: true,
            columntype: 'textbox', filtertype: 'input',
        },{
            text: 'Title', dataField: 'topic_title', minWidth: 120, sortable: true,
            columntype: 'textbox', filtertype: 'input',
        },{
            text: 'Status'    , dataField: 'topic_status' , cellsalign: 'center',
            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
            filterable: true, sortable: true,editable: true
        },{
            text: 'Created' , dataField: 'topic_insert', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false
        },{
            text: 'Modifield' , dataField: 'topic_update', width: 120, cellsalign: 'right',
            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
            sortable: true,editable: false, hidden:true
        }
    ];
    this.flag = false;
    this.jqxgrid = "#jqxgrid";
    this.init = function(){
        if(this.flag) return;
        this.flag = true;
        $("#jqxdropdownbutton").jqxDropDownButton({ width: 150, height: 25,theme:'metro'});
        $(me.jqxgrid).jqxGrid({
            theme: 'metro',
            width: 640,
            height: 320,
            autoheight: false,
            selectionmode       : 'singlecell',
            editmode            : 'dblclick',
            editable            : true,
            source: me._dataAdapter,
            groupable           : true,
            groups              : ['author_name'],
            pageable: true,
            pagesize : 100,
            pagesizeoptions     : [5,10,20,100],
            columnsresize: false,
            virtualmode         : true,
            columns: me._columns,
            rendergridrows      : function(){ 
                return me._dataAdapter.records; 
            },
            showstatusbar: true,
            renderstatusbar: function (statusbar) {
                // appends buttons to the status bar.
                var container = $("<div style='overflow: hidden; position: relative; padding: 2px;'></div>");
                var addButton = $("<div style='float: left; margin-left: 5px;'><span style='line-height:18px'>Add</span></div>");
                var reloadButton = $("<div style='float: left; margin-left: 5px;'><span style='line-height:18px'>Reload</span></div>");
                container.append(addButton);
                container.append(reloadButton);
                statusbar.append(container);
                addButton.jqxButton({  width: 60, height: 20 ,theme:'metro'});
                reloadButton.jqxButton({  width: 65, height: 20  ,theme:'metro'});
                // add new row.
                addButton.click(function (event) {
                    me.onAddItem();
                    $('#jqxdropdownbutton').jqxDropDownButton('close');
                });
                // reload grid data.
                reloadButton.click(function (event) {
                    me.onRefresh();
                });
            },
            handlekeyboardnavigation: function(event){
                var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
                if (key == 27) {
                    me._cancel=true;
                }
            },
        }).on("bindingcomplete", function (event) {
            $(me.jqxgrid).jqxGrid('expandallgroups');
        }).on('rowselect', function (event) {
            var args = event.args;
            var row = $(me.jqxgrid).jqxGrid('getrowdata', args.rowindex);
            if(row){
                // [{$tplConfig.name}].addFilter('topic_title',row.topic_title);
                var dropDownContent = '<div style="position: relative; margin-left: 3px; margin-top: 5px;">' + row['topic_title'] + '</div>';
                $("#jqxdropdownbutton").jqxDropDownButton('setContent', dropDownContent);
            }else{
                $("#jqxdropdownbutton").jqxDropDownButton('setContent', '<div style="position: relative; margin-left: 3px; margin-top: 5px;">Select Topic</div>');
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
                var _id = _data.topic_id;
                if (_id == undefined || _id == "") {
                    return;
                }
                
                switch (column) {
                    case 'topic_title':
                        if (_value != _data.topic_title && _value!='')
                            me.onCommit(
                                me.entryCommitUri,
                                {topic_title: _value},
                                _id,
                                me.onRefresh
                            );
                        break;
                    case 'topic_status':
                        if (_value)
                            me.onCommit(
                                me.entryCommitUri,{topic_status: 'true'}, _id,me.onRefresh
                            );
                        else
                            me.onCommit(
                                me.entryCommitUri,{topic_status: 'false'}, _id,me.onRefresh
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
        $("#jqxdropdownbutton").jqxDropDownButton('setContent', '<div style="position: relative; margin-left: 3px; margin-top: 5px;">Select Topic</div>');
        // $("#jqxgrid").jqxGrid('selectrow', 0);
        // $('#jqxdropdownbutton').jqxDropDownButton('open');
        // $('#jqxdropdownbutton').jqxDropDownButton('close');
    }
    
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
    this.onAddItem = function(){
        [{if $unit|strpos:".a."===false}]return;[{/if}]
        this.onEditItem(0,'');
    };
    this.onEditItem = function(Id,Layout){
            
        if (pending > 0)return;
        $('#iEntryDialog').html('...');
        $('#entry-container').html('...');
        httpRequest({
            'url'         :   
                me.EDITPANEL_URI +
                me.ENTRYTYPE+'/'+
                Layout,
            'data'        :   {
                'Id'  :   Id,
                layout: Layout
            },
            'callback'    :   function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    $('#iEntryDialog').html(rsdata.htmlreponse);
                    uidialog({
                        'message' : $('#iEntryDialog'),
                        'title': 'Topic !',
                        'width':'420px',
                        'type':'notice',
                        'buttons' : [{
                            'text': 'Done',
                            'class': 'ui-btn',
                            'click': function() {
                                me.onSave();
                            }
                        },{
                            'text': 'Cancel',
                            'class': 'ui-btn',
                            'click': function() {
                                $(this).dialog("close");
                            }
                        }]
                    }).open();
                    $('#entryForm').validationEngine({
                        'scroll': false,
                        validateNonVisibleFields:true
                    });
                    $('#entryForm .selectpicker').selectpicker();
                    $('#entryForm').validationEngine({'scroll': false});
                    $('#jqxdropdownbutton').jqxDropDownButton('close');
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
        if($('#sortable').length>0){
            var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
            Params.[{$tplConfig.prefix}]images = images.get().join('\r\n');
        }
        me.onCommit(me.entryCommitUri,Params,Id,function(rsdata){
            if(rsdata.result<0){
                addNotice(rsdata.message,'danger');
            }else{
                me.onRefresh();
                me.onCancel();
            }
        });
    };
    this.onCancel = function(){
        if($('body').hasClass('is-entry')) 
            $('body').removeClass('is-entry'); 
        else
            $('#iEntryDialog').dialog("close");
    };
    this.onRefresh = function(){
        $("#jqxgrid").jqxGrid('updatebounddata');
    };
    return this;
}
</script>