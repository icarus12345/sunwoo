<script type="text/javascript">
	var audioApp = (function(){
		var me = {};
		me.video = null;
		me.entryType='';
		me.editPanelUri = base_url + 'cms/vp/audio/editpanel/';
		me.bindingUri =  base_url + 'cms/vp/audio/widgetbinding/';
		me.commitUri =  base_url + 'cms/vp/audio/onCommit/';
		me.deleteUri =  base_url + 'cms/vp/audio/onDelete/';
		me.flag = false;
    	me.jqxgrid = "#jqx-audio";
		me._datafields = [
	        {name: 'audio_id', type: 'int'},
	        {name: 'audio_title'},
	        {name: 'audio_video', type: 'int'},
	        {name: 'audio_status',type: 'bool'},
	        {name: 'audio_insert', type: 'date'},
	        {name: 'audio_update', type: 'date'}
	    ];
	    me._source = {
	        datatype            : "json",
	        type                : "POST",
	        datafields          : me._datafields,
	        url                 : me.bindingUri + me.entryType,
	        id                  :'audio_id',
	        root                : 'rows',
	        filter: function() {
	            $(me.jqxgrid).jqxGrid('updatebounddata', 'filter');
	        },
	        sort: function() {
	            $(me.jqxgrid).jqxGrid('updatebounddata');
	        },
	    };
	    me._dataAdapter = new $.jqx.dataAdapter(me._source, {
	        // autoBind: true,
	        // beforeLoadComplete: function (records) {
	        //     for (var i = 0; i < records.length; i++) {
	        //         records[i].value = records[i].playlist_id;
	        //         records[i].label = records[i].playlist_title;
	        //     }
	        // },
	        loadError: function(xhr, status, error) {
	            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
	        }
	    });
	    me._columns = [
	        {
	            text: '', dataField: 'audio_id', width: 58, filterable: false, sortable: true,editable: false,
	            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
	                var str = "";
	                if (value && value > 0) {
	                    try {
	                        str += "<a href='JavaScript:void(0)'"+
	                        "style='margin: 5px; float: left;' " +
	                        "onclick=\"audioApp.onEditItem(" + value + ");\" "+ 
	                        "title='Edit Playlist:" + value + "'><i class=\"fa fa-pencil-square\"></i></a>\
	                        ";
	                        str += "\
	                            <a href='JavaScript:void(0)' style='margin: 5px; float: left;' onclick=\"audioApp.onDeleteItem(" + value + ");\" title='Delete Playlist :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
	                        ";
	                    } catch (e) {
	                    }
	                }
	                
	                return str;
	            }
	        },{
	            text: 'Playlist Title', dataField: 'audio_title', minWidth: 120, sortable: true,
	            columntype: 'textbox', filtertype: 'input',
	        },{
	            text: 'Video', dataField: 'audio_video', width: 100, sortable: false, hidden:true
	        },{
	            text: 'Status'    , dataField: 'audio_status' , cellsalign: 'center',
	            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
	            filterable: false, sortable: true,
	        },{
	            text: 'Created' , dataField: 'audio_insert', width: 120, cellsalign: 'right',
	            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
	            sortable: true,
	        },{
	            text: 'Modifield' , dataField: 'audio_update', width: 120, cellsalign: 'right',
	            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
	            sortable: true, hidden:true
	        }
	    ];
	    

	    me.init = function(){
	        if(me.flag){
	        	if(me.video)
	        		me.addFilter('audio_video',me.video.video_id);
	        	return;
	        }
	        me.flag = true;
            $(me.jqxgrid).jqxGrid({
                width 				: '100%', //autoheight:true,
		        height 				: '320',
		        source 				: me._dataAdapter,
		        theme 				: 'metro',
		        columns 			: me._columns,
		        selectionmode 		: 'singlecell',
		        editmode 			: 'dblclick',
				filterable 			: true,
		        autoshowfiltericon	: true,
		        showfilterrow 		: true,
				sortable 			: true,
				virtualmode 		: true,
		        // groupable 		    : true,
		        // groups              : ['video_title'],
		        editable            : true,
		        pageable            : false,
		        rendergridrows 		: function(){ 
		            return me._dataAdapter.records; 
		        },
		        ready: function(){
		        	if(me.video)
		        	me.addFilter('audio_video',me.video.video_id);
		        },
		        handlekeyboardnavigation: function(event)
		        {
		            var key = event.charCode ? event.charCode : event.keyCode ? event.keyCode : 0;
		            if (key == 27) {
		                me._cancel=true;
		            }
		        },
            });
	    }
	    me.onRefresh = function(){
	        $(me.jqxgrid).jqxGrid('updatebounddata');
	    };
		me.open = function(video){
			me.video = video;
			if ($("#audio-dialog").length === 0)
                $('body').append('<div id="audio-dialog" style="width:480px;height:320px"><div id="jqx-audio" style="width:480px;height:320px"></div></div>');
            uidialog({
                'message'   : $("#audio-dialog"),
                'title'     : "Audio of " + me.video.video_title,
                'width'     : '480px',
                'height'    : '320px',
                'onopen'    : function(){
                    
                },
                'buttons' : [{
                    'text': 'Add',
                    'class': 'ui-btn',
                    'click': function() {
                        me.onAddItem();
                    }
                }, {
                    'text': 'Cancel',
                    'class': 'ui-btn',
                    'click': function() {
                        $(this).dialog("close");
                    }
                }]
            }).open();
			me.init();

		};
		me.close = function(){
			$("#audio-dialog").dialog("close");
		};
		me.onAddItem = function(){
			[{if $unit|strpos:".a."===false}]return;[{/if}]
        	me.onEditItem(0,'');
		}
		me.onCommit = function(Url,Params, Id,callback) {
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
	    me.onEditItem = function(Id,Layout){
            
	        if (pending > 0)return;
	        $('#iEntryDialog').html('...');
	        $('#entry-container').html('...');
	        httpRequest({
	            'url'         :   
	                me.editPanelUri +
	                me.entryType+'/'+
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
	                        'title': 'Audio !',
	                        'width':'320px',
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
	                }
	            }
	        }).call();
	    };
	    me.onSave = function(){
	    	if(!me.video){
	    		addNotice('Video doest exists.','danger');
	    	}
	        if( $('#entryForm').validationEngine('validate') === false){
	            addNotice('Please complete required input.','info');
	            return;
	        }
	        var Id = $('#EntryId').val();
	        var Params =$('#entryForm').serializeObject();
	        Params.audio_video = me.video.video_id;
	        Params.audio_status = document.getElementById('squaredThreeaudioStatus').checked.toString();
	        me.onCommit(me.commitUri,Params,Id,function(rsdata){
	            if(rsdata.result<0){
	                addNotice(rsdata.message,'danger');
	            }else{
	                me.onRefresh();
	                me.onCancel();
	            }
	        });
	    };
	    me.onCancel = function(){
	    	$('#iEntryDialog').dialog("close");
	    };
	    me.onDeleteItem = function(Id){
	    	[{if $unit|strpos:".d."===false}]return;[{/if}]
	        ConfirmMsg(
	            'Delete item ?',
	            'These items will be permanently deleted and cannot be recovered. Are you sure ?',
	            function(){
	                httpRequest({
	                    'url': me.deleteUri,
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
	    me.addFilter = function(datafield, filtervalue){
	        var filtergroup = new $.jqx.filter(),
	            filtertype = 'numericfilter',
	            condition = 'EQUAL',
	            operator = 0,
	            filter = filtergroup.createfilter(filtertype, filtervalue, condition);
	        filtergroup.addfilter(operator, filter);
	        $(me.jqxgrid).jqxGrid('addFilter', datafield, filtergroup);
	        $(me.jqxgrid).jqxGrid('applyFilters');
	    };
	    me.chooseFile = function(){
	    	try {
		        window.KCFinder = {};
		        window.KCFinder.callBack = function(url) {
		           	window.KCFinder = null;
		           	var audioElm =
		           	'<audio controls>'+
					  	'<source src="'+url+'" type="audio/mpeg">'+
						'Your browser does not support the audio element.'+
					'</audio>';
					document.entryForm.audio_code.value = audioElm;
					$('#audio-preview').html(audioElm);
		        };
		        window.open(base_url + 'libraries/kcfinder/browse.php?lang=en&type=audio', 'kcfinder_textbox',
		            'status=0, toolbar=0, location=0, menubar=0, directories=0, resizable=1, scrollbars=0, width=700, height=500'
		        );
		    } catch (e) {
		        addNotice(e.message,'danger');
		    }
	    }
		return me;
	})();
</script>