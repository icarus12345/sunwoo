<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>CMS 1109</h4>
        </div>
        <div class="modal-body">
            HƯỚNG DẪN SỬ DỤNG<br/>
            Chú ý cập nhật trạng thái là enable để nội dung được hiện thị tại trang web<br/>
            Chú ý điền đầy đủ thông tin để nội dung được hiện thì đầy đủ ngoài website.<br/>

            <!-- XEM VIDEO<br/>
            <ul>
                <li><a target="_blank" href="/assets/video/Lang.webm">Dịch các ngôn ngữ</a></li>
                <li><a target="_blank" href="/assets/video/Slider.webm">Thêm, chỉnh sửa Slider tại trang chủ</a></li>
                <li><a target="_blank" href="/assets/video/Product.webm">Quản lý các công trình dự án, Thiết kế nội thất</a></li>
                <li><a target="_blank" href="/assets/video/News.webm">Quản lý tin tức, thông báo</a></li>
                <li><a target="_blank" href="/assets/video/Content.webm">Quản lý chỉnh sửa nội dung các trang web, các trang giới thiệu</a></li>
                <li><a target="_blank" href="/assets/video/Advisory.webm">Quản lý trả lời, thêm các câu hỏi tư vấn, câu hỏi giải đáp</a></li>
                <li><a target="_blank" href="/assets/video/KCFinder.webm">Sử dụng phần mềm quản lý, upload hình ảnh</a></li>
            </ul> -->
            <div id="helper-scrollspy" data-spy="scroll" data-target="#navbar-helper">
                <div id="navbar-helper">
                    <ul class="" role="tablist">
                        [{foreach $helpers as $item}]
                        <li><a href="#spy-[{$item->_id}]">[{$item->_title}]</a></li>
                        [{/foreach}]
                    </ul>

                </div>
                [{foreach $helpers as $item}]
                <div class="panel panel-default">
                  <div class="panel-heading text-uppercase" id="spy-[{$item->_id}]">[{$item->_title}]</div>
                  <div class="panel-body">
                    <div class="">[{$item->_content}]</div>
                  </div>
                </div>
                [{/foreach}]
            </div>
            <script type="text/javascript">
                // $('#helper-scrollspy').scrollspy({ target: '#navbar-helper' })
                // $('#helper-collapsible').collapse({
                //   toggle: false
                // })
            </script>
        </div>
    </div>
</div>