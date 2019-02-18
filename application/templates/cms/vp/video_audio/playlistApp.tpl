<script type="text/javascript">
	var playlistApp = (function(){
		var me = {};
		me.video_id = null;
		me.entryType='';
		me.editPanelUri = base_url + 'cms/vp/playlist/editpanel/';
		me.bindingUri =  base_url + 'cms/vp/playlist/widgetbinding/';
		me.commitUri =  base_url + 'cms/vp/playlist/onCommit/';
		me.deleteUri =  base_url + 'cms/vp/playlist/onDelete/';
		me.flag = false;
    	me.jqxgrid = "#jqwidget-playlist-list";
		me._datafields = [
	        {name: 'playlist_id', type: 'int'},
	        {name: 'playlist_title'},
	        {name: 'playlist_videos'},
	        {name: 'playlist_status',type: 'bool'},
	        {name: 'playlist_insert', type: 'date'},
	        {name: 'playlist_update', type: 'date'}
	    ];
	    me._source = {
	        datatype            : "json",
	        type                : "POST",
	        datafields          : me._datafields,
	        url                 : me.bindingUri + me.entryType,
	        id                  :'playlist_id',
	        root                : 'rows',
	        filter: function() {
	            $(me.jqxgrid).jqxGrid('updatebounddata', 'filter');
	        },
	        sort: function() {
	            $(me.jqxgrid).jqxGrid('updatebounddata');
	        },
	    };
	    me._dataAdapter = new $.jqx.dataAdapter(me._source, {
	        autoBind: true,
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
	            text: '', dataField: 'playlist_id', width: 58, filterable: false, sortable: true,editable: false,
	            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
	                var str = "";
	                if (value && value > 0) {
	                    try {
	                        str += "<a href='JavaScript:void(0)'"+
	                        "style='margin: 5px; float: left;' " +
	                        "onclick=\"playlistApp.onEditItem(" + value + ");\" "+ 
	                        "title='Edit Playlist:" + value + "'><i class=\"fa fa-pencil-square\"></i></a>\
	                        ";
	                        str += "\
	                            <a href='JavaScript:void(0)' style='margin: 5px; float: left;' onclick=\"playlistApp.onDeleteItem(" + value + ");\" title='Delete Playlist :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
	                        ";
	                    } catch (e) {
	                    }
	                }
	                
	                return str;
	            }
	        },{
	            text: 'Playlist Title', dataField: 'playlist_title', minWidth: 120, sortable: true,
	            columntype: 'textbox', filtertype: 'input',
	        },{
	            text: 'Videos', dataField: 'playlist_videos', width: 100, sortable: false, hidden:true
	        },{
	            text: 'Status'    , dataField: 'playlist_status' , cellsalign: 'center',
	            width: 44, columntype: 'checkbox', threestatecheckbox: false, filtertype: 'bool',
	            filterable: false, sortable: true,
	        },{
	            text: 'Created' , dataField: 'playlist_insert', width: 120, cellsalign: 'right',
	            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
	            sortable: true,
	        },{
	            text: 'Modifield' , dataField: 'playlist_update', width: 120, cellsalign: 'right',
	            filterable: true, columntype: 'datetimeinput', filtertype: 'range', cellsformat: 'yyyy-MM-dd HH:mm:ss',
	            sortable: true, hidden:true
	        }
	    ];
	    me.nestedTables = new Array();
	    me.initRowDetails = function (id, row, element, rowinfo) {
            element.append($("<div style='border:0px solid #ccc'></div>"));
            element.css({border:'1px solid #ccc'});
            var nestedDataTable = $(element.children()[0]);
            if (nestedDataTable != null) {
            	var nestedSource = {
			        datatype            : "json",
			        type                : "POST",
			        datafields          : [
			        	{name: 'video_id', type: 'int'},
        				{name: 'video_title'},
			        ],
			        url                 : base_url + 'cms/vp/playlist/nestedBinding/'+id,
			        id                  :'video_id',
			        root                : 'rows'
			    };
			    var nestedDataAdapter = new $.jqx.dataAdapter(nestedSource, {
			        // autoBind: true,
			        loadError: function(xhr, status, error) {
			            addNotice("<b>Status</b>:" + xhr.status + "<br/><b>ThrownError</b>:" + error + "<br/>", 'Error Message!', 'danger');
			        }
			    });
                nestedDataTable.jqxDataTable({
                	theme 				: 'metro',
                    source 				: nestedDataAdapter, 
                    width 				: '100%', 
                    height 				: '180',
                    serverProcessing 	: true,
                    pageable 			: true,
	                pageSize 			: 10,
	                pagerButtonsCount 	: 5,
                    columns: [
                      	{ 
                      		text: 'Video Id', dataField: 'video_id', width: 60 ,
                      		cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
				                var str = "";
				                if (value && value > 0) {
				                    try {
				                        str += "<a href='JavaScript:void(0)'"+
				                        "style='margin: 5px; float: left;' " +
				                        "onclick=\"playlistApp.removeOnPlaylist(" + id + ',' + value + ");\" "+ 
				                        "title='Remove from Playlist:" + value + "'><i class=\"fa fa-minus-circle\"></i></a>\
				                        ";
				                    } catch (e) {
				                    }
				                }
				                
				                return str;
				            }
                  		},
                      	{ text: 'Video Title', dataField: 'video_title', minWidth: 200 }
                   ]
                });
                // store the nested Data Tables and use the Employee ID as a key.
                me.nestedTables[id] = nestedDataTable;
            }
        };

	    me.init = function(){
	        if(me.flag){
	        	if(me.video_id)
	        		me.addFilter('playlist_videos',me.video_id);
	        	return;
	        }
	        me.flag = true;
            $(me.jqxgrid).jqxDataTable({
                width 				: '100%',
                height 				: '100%',
                theme  				:'metro',
                source 				: me._dataAdapter,
                sortable 			: true,
                altRows 			: true,
                filterable 			: true,
                filterMode 			: 'advanced',
                pageable 			: true,
                serverProcessing 	: true,
                pageSize 			: 10,
                pagerButtonsCount 	: 5,
                columns 			: me._columns,
                rowDetails 			: true,
                initRowDetails		: me.initRowDetails,
                ready: function () {
                    if(me.video_id)
	        			me.addFilter('playlist_videos',me.video_id);
                    // $(me.jqxgrid).jqxDataTable('showDetails', 0);
                },
            });
	    }
	    me.onRefresh = function(){
	        $(me.jqxgrid).jqxGrid('updatebounddata');
	    };
		me.open = function(video_id){
			$('#playlist-widget').show();
			$('.jqx-navbar-icons').hide();
			me.video_id = video_id;
			me.init();

		};
		me.close = function(){
			$('#playlist-widget').hide();
			$('.jqx-navbar-icons').show();
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
	                        'title': 'Playlist !',
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
	        if( $('#entryForm').validationEngine('validate') === false){
	            addNotice('Please complete required input.','info');
	            return;
	        }
	        var Id = $('#EntryId').val();
	        var Params =$('#entryForm').serializeObject();
	        Params.playlist_status = document.getElementById('squaredThreePlaylistStatus').checked.toString();
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
	    me.removeOnPlaylist = function(playlistId,videoId){
	    	[{if $unit|strpos:".d."===false}]return;[{/if}]
	        ConfirmMsg(
	            'Delete item ?',
	            'These items will be permanently deleted and cannot be recovered. Are you sure ?',
	            function(){
	                httpRequest({
	                    'url': base_url + 'cms/vp/playlist/removeVideo/',
	                    'data': {
	                        'playlistId': playlistId,
	                        'videoId': videoId
	                    },
	                    'callback': function(rsdata) {
	                        if (rsdata.result < 0) {
	                            addNotice(rsdata.message,'danger');
	                        } else {
	                            addNotice(rsdata.message,'info');
	                            if(me.nestedTables[playlistId])
	                            me.nestedTables[playlistId].jqxDataTable('updateBoundData');
	                        }
	                    }
	                }).call();
	            }
	        );
	    };
	    me.addVideoToPlaylist = function(playlistId,videoId){
	    	httpRequest({
                'url': base_url + 'cms/vp/playlist/addVideoToPlaylist/',
                'data': {
                    'playlistId': playlistId,
                    'videoId': videoId
                },
                'callback': function(rsdata) {
                    if (rsdata.result < 0) {
                        addNotice(rsdata.message,'danger');
                    } else {
                        addNotice(rsdata.message,'info');
                        if(me.nestedTables[playlistId])
                        	me.nestedTables[playlistId].jqxDataTable('updateBoundData');
                    }
                }
            }).call();
	    };
	    me.addFilter = function(datafield, filtervalue){
	        var filtergroup = new $.jqx.filter(),
	            filtertype = 'stringfilter',
	            condition = 'CONTAINS',
	            operator = 0,
	            filter = filtergroup.createfilter(filtertype, filtervalue, condition);
	        filtergroup.addfilter(operator, filter);
	        $(me.jqxgrid).jqxDataTable('addFilter', datafield, filtergroup);
	        $(me.jqxgrid).jqxDataTable('applyFilters');
	    };
		return me;
	})();
</script>