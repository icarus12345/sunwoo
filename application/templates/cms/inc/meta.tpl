<!DOCTYPE html>
<html lang="en">
    <head>
        <title>[{#pageTitle#}]</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="[{'libraries/images/tk1109_green.jpg'|base_url}]" type="image/x-icon">
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/bootstrap.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/ui/themes/base/jquery.ui.all.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/bootstrap-select.min.css'|base_url}]"/>
<!--        <link rel="stylesheet" type="text/css" href="[{'libraries/plugin/select2/select2.css'|base_url}]"/>-->
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/font-awesome.css'|base_url}]">
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/bootstrap-datetimepicker.min.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/bootstrap-colorpicker.min.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/cms.css'|base_url}]"/>
        <link href="[{'libraries/plugin/accordion-menu/jquery-accordion-menu.css'|base_url}]" rel="stylesheet">
        <link href="[{'libraries/plugin/tokeninput/token-input.css'|base_url}]" rel="stylesheet">


        

        <script type="text/javascript" src="[{'libraries/bootstrap/js/jquery-1.9.1.min.js'|base_url}]"></script>

        
        
        <script type="text/javascript" src="[{'libraries/ui/js/jquery-ui-1.9.2.custom.min.js'|base_url}]"></script>
        <script>
            $.widget.bridge('uitooltip', $.ui.tooltip);
        </script>
        <script type="text/javascript" src="[{'libraries/bootstrap/js/bootstrap.min.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/bootstrap/js/bootstrap-select.min.js'|base_url}]"></script>
<!--        <script type="text/javascript" src="[{'libraries/plugin/select2/jquery.select2.min.js'|base_url}]"></script>-->
        <script type="text/javascript" src="[{'libraries/bootstrap/js/moment.min.js'|base_url}]"></script> 
        <script type="text/javascript" src="[{'libraries/bootstrap/js/bootstrap-datetimepicker.min.js'|base_url}]"></script> 
        <script type="text/javascript" src="[{'libraries/bootstrap/js/bootstrap-colorpicker.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/bootstrap/js/dateformat.js'|base_url}]"></script>
        <!-- <script type="text/javascript" src="[{'libraries/plugin/datatable/jquery.dataTables.min.js'|base_url}]"></script> -->
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
        <script type="text/javascript" src="[{'libraries/plugin/validation-engine/jquery.validationEngine.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/plugin/validation-engine/jquery.validationEngine-en.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.concat.min.js'|base_url}]"></script>
        <!-- // <script type="text/javascript" src="[{'libraries/plugin/accordion-menu/jquery-accordion-menu.js'|base_url}]"></script> -->
        <script type="text/javascript" src="[{'libraries/cms/cms.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/plugin/tmpl.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/ckeditor/ckeditor.js'|base_url}]" ></script>
        <script type="text/javascript" src="[{'libraries/plugin/tokeninput/jquery.tokeninput.js'|base_url}]" ></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyB6TJrMx3v003kFpoOUSgugZSk8j1WWK_s"></script>

        <link rel="stylesheet" type="text/css" href="[{'libraries/plugin/datatable/dataTables.bootstrap.css'|base_url}]"/>
        <link rel="stylesheet" type="text/css" href="[{'libraries/plugin/datatable/fixedColumns.bootstrap.css'|base_url}]"/>
        <script type="text/javascript" src="[{'libraries/plugin/datatable/dataTables.bootstrap.min.js'|base_url}]"></script>
        <script type="text/javascript" src="[{'libraries/plugin/datatable/dataTables.fixedColumns.min.js'|base_url}]"></script>
        <!--[if IE]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
        $('document').ready(function(){
            [{if $smarty.get.navi}]
                setTimeout(function(){
                    $('li[data-id=[{$smarty.get.navi}]]>a').click()
                },1000);
            [{/if}]
        });
        </script>
    </head>
    <body>
