<script type="text/x-tmpl" id="tmpl-entry">
    <div class="panel panel-default">
        <div class="panel-body">
            {% if(o.[{$tplConfig.prefix}]thumb){ %}
            <img style="float: left;margin-right: 8px;" src="{%=o.[{$tplConfig.prefix}]thumb%}" height="60"/>
            {% } %}
            <div>
                <div class="c-gray">{%=o.[{$tplConfig.prefix}]name%}</div>
                <p class="word-wrap">{%=o.[{$tplConfig.prefix}]desc%}</p>
            </div>
        </div>
        [{if $unit}]
        <div class="action">
            <div class="btn-group dropup">
                <div class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-ellipsis-v"></i>
                </div>
                <ul class="dropdown-menu" role="menu">
                    [{if $unit|strpos:"d"!==false}]
                    <li class="{%=o.[{$tplConfig.prefix}]lock=='true'?'disabled':'' %}">
                        <a href="JavaScript:" onclick="{%=o.[{$tplConfig.prefix}]lock!='true'?'[{$tplConfig.name}].onDeleteItem('+o.[{$tplConfig.prefix}]id+')':'' %}"><span class="fa fa-trash-o"></span> Delete entry</a>
                    </li>
                    [{/if}]
                    [{if $unit|strpos:"l"!==false}]
                    <li class="{%=o.[{$tplConfig.prefix}]lock=='true'?'disabled':'' %}">
                        <a href="JavaScript:" onclick="{%=o.[{$tplConfig.prefix}]lock!='true'?'[{$tplConfig.name}].onLockItem('+o.[{$tplConfig.prefix}]id+')':'' %}"><span class="fa fa-lock"></span> Lock entry</a>
                    </li>
                    [{/if}]
                    <li class="divider"></li>
                    <li class="disabled"><a href="JavaScript:"><span class="fa fa-eye"></span> Preview</a></li>
                </ul>
                [{if $unit|strpos:"e"!==false}]
                <div onclick="[{$tplConfig.name}].onEditItem('{%=o.[{$tplConfig.prefix}]id%}')" 
                     class="btn btn-default"
                     title="Click to edit entry({%=o.[{$tplConfig.prefix}]id%})"
                     >
                    <span class="fa fa-pencil"></span>
                </div>
                {% if(o.[{$tplConfig.prefix}]status=='true'){ %}
                <div onclick="[{$tplConfig.name}].changeStatus('false','{%=o.[{$tplConfig.prefix}]id%}')" 
                     class="btn btn-default"
                     title="Click to disable entry"
                     >
                    <span class="fa fa-toggle-on"></span>
                </div>
                {% }else{ %}
                <div onclick="[{$tplConfig.name}].changeStatus('true','{%=o.[{$tplConfig.prefix}]id%}')" 
                     title="Click to enable entry"
                     class="btn btn-default">
                    <span class="fa fa-toggle-off"></span>
                </div>
                {% } %}
                [{/if}]
            </div>
            <div class="pull-right modified" title="Last modified">
                <i class="fa fa-clock-o"></i>
                {%=o.[{$tplConfig.prefix}]update?o.[{$tplConfig.prefix}]update:o.[{$tplConfig.prefix}]insert%}
            </div>
        </div>
        [{/if}]
    </div>
</script>