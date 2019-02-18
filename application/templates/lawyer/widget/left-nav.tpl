<div class="left-nav transition">
    <div class="small-scrollbar">
        <div class="container">
        	<div class="space-line"></div>
            <div>
                <div><i class="fa fa-phone"></i> <i class="code">Tư vấn trực tiếp</i> <span class="label c-red pull-right">09x xxx xxx</span></div>
                <div class="half-space-line"></div>
                <div class="advertising">
                    <img src="/assets/lawyer/images/about_us.jpg"/>
                </div>
            </div>
            <div class="space-line"></div>
            [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left/news-event-tab.tpl"}]
            [{*include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left/hot-news.tpl"*}]
            [{*include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left/hot-event.tpl"*}]

            
            
           
            <!-- -->
            <div>
                <div id="left-gallery" class="owl-carousel owl-gallery">
                    <div class="item" style="background-image:url('/assets/lawyer/img/e.jpg');"></div>
                    <div class="item" style="background-image:url('/assets/lawyer/img/f.jpg');"></div>
                    <div class="item" style="background-image:url('/assets/lawyer/img/g.jpg');"></div>
                    <div class="item" style="background-image:url('/assets/lawyer/img/h.jpg');"></div>
                </div>
            </div>
            <!-- -->
            <div class="space-line"></div>
            
            [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left/feature-advisory.tpl"}]
            
            <!-- Calendar -->
            
            <div class="calendar">
                <div id="calendar" class="bootstrap-datetimepicker-widget picker-open">
                    <div class="datepicker">
                        <div class="datepicker-days" style="display:block">
                            <table class="table-condensed">
                                <thead>
                                    <tr>
                                        <th class="prev" onclick="getcalendar(2015,3)">‹</th>
                                        <th colspan="5" class="picker-switch">April&nbsp;2015</th>
                                        <th class="next" onclick="getcalendar(2015,5)">›</th>
                                    </tr>
                                    <tr>
                                        <th class="dow">Mo</th>
                                        <th class="dow">Tu</th>
                                        <th class="dow">We</th>
                                        <th class="dow">Th</th>
                                        <th class="dow">Fr</th>
                                        <th class="dow">Sa</th>
                                        <th class="dow">Su</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td class="day">1</td>
                                        <td class="day">2</td>
                                        <td class="day">3</td>
                                        <td class="day">4</td>
                                        <td class="day">5</td>
                                    </tr>
                                    <tr>
                                        <td class="day">6</td>
                                        <td class="day">7</td>
                                        <td class="day">8</td>
                                        <td class="day active today"><div class="highlight"><b>9</b></div></td>
                                        <td class="day">10</td>
                                        <td class="day">11</td>
                                        <td class="day">12</td>
                                    </tr>
                                    <tr>
                                        <td class="day">13</td>
                                        <td class="day">14</td>
                                        <td class="day">15</td>
                                        <td class="day">16</td>
                                        <td class="day">17</td>
                                        <td class="day">18</td>
                                        <td class="day">19</td>
                                    </tr>
                                    <tr>
                                        <td class="day">20</td>
                                        <td class="day">21</td>
                                        <td class="day">22</td>
                                        <td class="day">23</td>
                                        <td class="day">24</td>
                                        <td class="day">25</td>
                                        <td class="day">26</td>
                                    </tr>
                                    <tr>
                                        <td class="day">27</td>
                                        <td class="day">28</td>
                                        <td class="day">29</td>
                                        <td class="day">30</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="pending"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="space-line"></div>
            <!-- -->
        </div>
    </div>
</div>