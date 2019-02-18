<div class="content to-back">
    <div class="wrapper">
        <div class="container">
            [{if #crumbTpl#}]
                [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#crumbTpl#}]
            [{/if}]
            <div class="row ">
                <div class="entrys transition">
                    <div>
                        <div>
                            <div id="entry-editor" class="entry-editor">
                                <div class="container">
                                    [{if #entryEditorTpl#}]
                                        [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#entryEditorTpl#}]
                                    [{/if}]
                                </div>
                            </div>
                            <div class="entry-list">
                                <div class="container">
                                    <div class="mark"></div>
                                    [{if #entryListTpl#}]
                                        [{include file=$smarty.const.APPPATH|cat:"templates/"|cat:#entryListTpl#}]
                                    [{/if}]
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>