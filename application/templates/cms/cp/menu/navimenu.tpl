<ul>
[{foreach from=$menus item=c}]
[{if $c->menu_status=='true'}]
    <li class="menu-header"><a href="#"> [{$c->menu_title}]</a></li>
    [{if $c->menu_children}]
    [{foreach from=$c->menu_children item=c1}]
    <li data-id="[{$c1->menu_id}]">
    [{if $c1->menu_status=='true'}]
    <a href="[{$c1->menu_link|default:'#'}]"><i class="[{$c1->menu_class|default:''}]"></i>[{$c1->menu_title}]</a>
    [{if $c1->menu_children}]
        <ul class="submenu">
        [{foreach from=$c1->menu_children item=c2}]
        [{if $c2->menu_status=='true'}]
            <li><a href="[{$c2->menu_link|default:''}]">[{$c2->menu_title|default:''}]</a></li>
        [{/if}]
        [{/foreach}]
        </ul>
    [{/if}]
    [{/if}]
    </li>
    [{/foreach}]
    [{/if}]
[{/if}]
[{/foreach}]
</ul>