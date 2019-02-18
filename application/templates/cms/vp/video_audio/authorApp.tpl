<script type="text/javascript">
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
        {
            text: '', dataField: 'author_id', width: 60, filterable: false, sortable: true,editable: false,
            cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                var str = "";
                if (value && value > 0) {
                    try {
                        str += "<a href='JavaScript:void(0)'"+
                        "style='margin: 5px; float: left;' " +
                        "onclick=\"authorApp.onEditItem(" + value + ");\" "+ 
                        "title='Edit :" + value + "'><i class=\"fa fa-pencil-square\"></i></a>\
                        ";
                        str += "\
                            <a href='JavaScript:void(0)' style='margin: 5px; float: left;' onclick=\"authorApp.onDeleteItem(" + value + ");\" title='Delete :" + value + "'><i class=\"fa fa-trash-o\"></i></a>\
                        ";
                    } catch (e) {
                    }
                }
                
                return str;
            }
        },{
            text: 'Title', dataField: 'author_name', minWidth: 220, sortable: true,
            columntype: 'textbox', filtertype: 'input',
        }
    ];
    this.flag = false;
    this.init = function(){
        if(this.flag) return;
        this.flag = true;
        $("#jqxdropdownbutton-author").jqxDropDownButton({ width: 150, height: 25,theme:'metro'});
        $("#jqxgrid-author").jqxGrid({
            theme: 'metro',
            width: 340,
            //height: 240,
            source: me._dataAdapter,
            pageable: true,
            pagesize : 10,
            pagesizeoptions     : [5,10,20,100],
            autoheight: true,
            columnsresize: false,
            columns: me._columns,
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
                    $('#jqxdropdownbutton-author').jqxDropDownButton('close');
                });
                // reload grid data.
                reloadButton.click(function (event) {
                    me.onRefresh();
                });
            }
        }).on('rowselect', function (event) {
            var args = event.args;
            var row = $("#jqxgrid-author").jqxGrid('getrowdata', args.rowindex);
            if(row){
                var dropDownContent = '<div style="position: relative; margin-left: 3px; margin-top: 5px;">' + row['topic_title'] + '</div>';
                $("#jqxdropdownbutton-author").jqxDropDownButton('setContent', dropDownContent);
            }else{
                $("#jqxdropdownbutton-author").jqxDropDownButton('setContent', '<div style="position: relative; margin-left: 3px; margin-top: 5px;">Select Author</div>');
            }
        });
        $("#jqxdropdownbutton-author").jqxDropDownButton('setContent', '<div style="position: relative; margin-left: 3px; margin-top: 5px;">Select Author</div>');
        // $("#jqxgrid").jqxGrid('selectrow', 0);
        // $('#jqxdropdownbutton').jqxDropDownButton('open');
        // $('#jqxdropdownbutton').jqxDropDownButton('close');
    };
    return this;
};
</script>