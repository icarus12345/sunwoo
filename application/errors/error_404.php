<!DOCTYPE html>
<html lang="en">
    <head>
        <title>404 Page Not Found</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link href="/libraries/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <script src="/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
        <style type="text/css">
            *{
                margin: 0;
            }
            body{
                background: url('/libraries/images/bg/bg-body.png');
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 14px;
                line-height: 20px;
                color: #555;
            }
            body,html{
                display: block;
                height: 100%;
            }
            .content-wrapper{
                padding: 40px
            }
            .panel{
                background: #fff;
                border: 1px solid #dfdfdf;
                padding: 20px 20px 20px 20px;
                position: relative;
                max-width: 480px;
                margin: 0 auto;
            }
            
            p.notice{
                padding: 20px;margin: 0;
                background: #FAFBFC;
                border-bottom: 1px solid #dfdfdf;
                text-align: center;
            }
            .error-img{
                float: left;
                padding-right: 20px;
            }
            .error-img-mobile{
                display: none;
                
            }
            .clear{clear:both}
            .divider {
                height: 6px;
                margin: 20px 0px 25px 0px;
                background: url(/libraries/images/bg/divider.png) repeat;
                clear: both;
                display: block;
            }
            h1{
                line-height: 40px;
                font-weight: normal;
            }
            a,a:link,a:active{
                color: #aaa;
            }
            @media (max-width:768px){
                body,html{
                    display: block;
                    height: auto;
                }
                .content-wrapper{
                    padding: 20px;
                }
                .error-img{
                    display: none;
                }
                .error-img-mobile{
                    display: block;
                    margin: 0 auto;
                    max-width: 90%;
                    margin-top: 20px;
                }
            }
            .glyphicon,.awesome {position: relative;top: 1px;display: inline-block;font-style: normal;font-weight: normal;line-height: 1;-webkit-font-smoothing: antialiased;-moz-osx-font-smoothing: grayscale;}
            .awesome{font-family: FontAwesome}
            .awesome-f120:before {content: "\f120";}
            .awesome-f188:before {content: "\f188";}
            .awesome-f180:before {content: "\f180";}
            .awesome-f140:before {content: "\f140";}
            .bug{
                position: fixed;z-index: 10;
                /*-webkit-animation:spin 4s linear infinite;
                -moz-animation:spin 4s linear infinite;
                animation:spin 4s linear infinite;*/
            }
            .btn {display: inline-block;padding: 6px 12px;margin-bottom: 0;font-size: 14px;font-weight: normal;line-height: 1.42857143;text-align: center;white-space: nowrap;vertical-align: middle;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;background-image: none;}
            .btn{border: 1px solid #bdc7d8;background: #fff;color: #777;}
            a.btn{text-decoration: none}
            @-moz-keyframes spin { 100% { -moz-transform: rotate(360deg); } }
            @-webkit-keyframes spin { 100% { -webkit-transform: rotate(360deg); } }
            @keyframes spin { 100% { -webkit-transform: rotate(360deg); transform:rotate(360deg); } }
        </style>
        <script type="text/javascript">
            function getOffset( el ) {
                var _x = 0;
                var _y = 0;
                while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
                    _x += el.offsetLeft - el.scrollLeft;
                    _y += el.offsetTop - el.scrollTop;
                    el = el.offsetParent;
                }
                return { top: _y, left: _x };
            }
            var n =0;
            
            var bug = function(t, l, f){
                var me = this;
                this.t = t;
                this.l = l;
                this.f = f;
                this.a = true;
                this.maxclone =  Math.floor(Math.random() * 4)+1;
                this.clone = function(){
                    if(me.f==14){
                        if(me.b==null)return;
                        var oldq = me.b.offset();
                        if(me.maxclone == 0){
                            if(n>5){
                                n--;
                                me.a = false;
                                me.b.stop().animate({top:$(window).height()-16},1000,function(){
                                    me.b.animate({top:$(window).height()},1000,function(){
                                        me.b.remove();
                                        me.b = null;
                                        delete(me);
                                    })
                                    
                                })
                                return;
                            }
                        }else if(n<10){
                            var f = Math.floor(Math.random() * (13 -8))+8;
                            new bug(oldq.top, oldq.left, f);
                        }
                        me.maxclone--;
                    }
                    setTimeout(me.clone,Math.random() * 2000 + 2000);
                };
                this.makeNewPosition = function(){
                    // Get viewport dimensions (remove the dimension of the div)
                    var h = $(window).height()+50;
                    var w = $(window).width()+50;
                    var nh = Math.floor(Math.random() * h) -50;
                    var nw = Math.floor(Math.random() * w) -50;
                    return [nh,nw];    
                }
                this.calcSpeed = function(prev, next) {
                    var x = Math.abs(prev[1] - next[1]);
                    var y = Math.abs(prev[0] - next[0]);
                    var greatest = x > y ? x : y;
                    var speedModifier = 0.1;
                    var speed = Math.ceil(greatest/speedModifier);
                    return speed;
                }
                
                
                this.animate = function(){
                    if(!me.a) return;
                    if(me.b==null)return;
                    var newq = me.makeNewPosition();
                    var oldq = me.b.offset();
                    var speed = me.calcSpeed([oldq.top, oldq.left], newq);
                    me.t = newq[0];
                    me.l = newq[1];
                    var angleDeg = 90 + Math.atan2(me.t - oldq.top, me.l - oldq.left)* 180 / Math.PI;
                    if(me.f < 14){
                        me.f ++;
                        if(me.f>14)me.f=14;
                        me.b.css({'font-size':me.f+'px'});
                    }
                    me.b
                    .css({
                        '-ms-transform': 'rotate('+angleDeg+'deg)',
                        '-webkit-transform': 'rotate('+angleDeg+'deg)',
                        'transform': 'rotate('+angleDeg+'deg)'
                    })
                    .animate({ 
                        'top': me.t,
                        'left': me.l
                    }, speed, function(){
                      me.animate();        
                    });
                };
                var c = ((1<<24)*Math.random()|0).toString(16);
                this.b = $('<i class="bug awesome awesome-f188" style="top:'+this.t+'px;left:'+this.l+'px;color:#'+c+'"></i>');
                $('body').append(this.b);
                this.animate();
                n++;
                setTimeout(this.clone,Math.random() * 2000 + 1000);
            };
            $(document).ready(function(){
                $('.char-bugs').each(function(){
                    var chars = $(this).text();
                    var str="";
                    $.each(chars.split(''),function(index, value){
                        str += '<span class="unmove">'+value+'</span>'
                    })
                    $(this).html(str);
                });
                var docHeight = $(document).height(),
                    docWidth = $(document).width();
                var l = Math.floor( Math.random() * docWidth );
                var t = Math.floor( Math.random() * docHeight );
                new bug(t, l, 14);
                
            });
            

            

            
        </script>
    </head>
    <body>
        <p class="notice">And you may ask yourself, well, how did I get here ?</p>
        <div class="content-wrapper">
            <div class="panel error-mobile">
                <div class="eight columns">
                    <h1>Error 404</h1>
                    <div>Ooops, page not found...</div>
                    <div class="divider"></div>
                    <img class="error-img" alt="error" src="/libraries/images/bg/404.jpg">
                    <p class="char-bugs">We're sorry, but we can't find the page you were looking for.It's probably some thing we've done wrong but now we know about it we'll try to fix it.</p><br>
                    <a class="btn btn-default" href="/">
                        <i class="awesome  fa-home"></i> Home 
                    </a>
                    <img class="error-img-mobile" alt="error" src="/libraries/images/bg/404.jpg">
                    
                    <i class="awesome fa-ambulance"></i>
                    <i class="awesome fa-ambulance"></i>
                    <i class="awesome fa-ambulance"></i>
                    <i class="awesome fa-ambulance"></i>
                    <i class="awesome fa-ambulance"></i>
                    <i class="awesome fa-ambulance"></i>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>