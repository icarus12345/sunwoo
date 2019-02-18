<div class="primary-color text-uppercase">
    [{if $cate=='408'}]<b>[{$languages['all_buildings-project']|default:'Công trình - dự án'}]</b>[{/if}]
    [{if $cate=='409'}]<b>[{$languages['all_interested_customers']|default:'Khách hàng quan tâm'}]</b>[{/if}]
    [{if $cate=='410'}]<b>[{$languages['all_interior-design']|default:'Thiết kế nội thất'}]</b>[{/if}]
    [{if $cate=='0'}]<b>[{$languages.all_advisory|default:'TƯ VẤN'}] - [{$languages.all_ask|default:'HỎI ĐÁP'}]</b>[{/if}]
    [{if $cate=='406'}]<b>[{$languages.all_news|default:'TIN TỨC'}]</b>[{/if}]
    [{if $cate=='407'}]<b>[{$languages.all_notification|default:'THÔNG BÁO'}]</b>[{/if}]
</div>
<h3>[{$languages.all_architectural_building|default:'KIẾN TRÚC XÂY DỰNG'}]</h3>
<ul class="nav-left-menu">
    <li><a href="/gioi-thieu">[{$languages.all_about|default:'Giới thiệu'}]<span class="pull-right">»</span></a></li>
    <li [{if $cate=='406' or $cate=='407'}]class="active"[{/if}]>
      <a href="/tin-tuc">
      [{$languages.all_news|default:'Tin tức'}] - [{$languages.all_event|default:'Sự kiện'}] <span class="pull-right">»</span>
      </a>
    </li>
    <li [{if $cate=='408'}]class="active"[{/if}]><a href="/cong-trinh">[{$languages['all_buildings-project']|default:'Công trình - dự án'}]<span class="pull-right">»</span></a></li>
    <li [{if $cate=='409'}]class="active"[{/if}]><a href="/quan-tam">[{$languages['all_interested_customers']|default:'Khách hàng quan tâm'}]<span class="pull-right">»</span></a></li>
    <li [{if $cate=='410'}]class="active"[{/if}]><a href="/thiet-ke">[{$languages['all_interior-design']|default:'Thiết kế nội thất'}]<span class="pull-right">»</span></a></li>
</ul>
<div class="qa">
    [{if $lang=='en'}]
    <img src="/assets/nha-dat/img/qa-en.png">
    <a href="/cong-trinh"><img src="/assets/nha-dat/img/other-en.png"></a>
    [{else}]
    <img src="/assets/nha-dat/img/qa.jpg">
    <a href="/cong-trinh"><img src="/assets/nha-dat/img/other.jpg"></a>
    [{/if}]
</div>