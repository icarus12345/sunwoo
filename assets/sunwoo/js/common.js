/*
 * common.js
 * ---
 * @author takaaki.koyama
 * ---
 * ---------------------------------------------
 * (c) baqemono.inc. all rights reserved.
 * ---------------------------------------------
 */
 (function(){
	for(var a=0,b=["ms","moz","webkit","o"],c=0;c<b.length&&!window.requestAnimationFrame;++c){
		window.requestAnimationFrame = window[b[c]+"RequestAnimationFrame"];
		window.cancelAnimationFrame = window[b[c]+"CancelAnimationFrame"]||window[b[c]+"CancelRequestAnimationFrame"]
	}
	if(!window.requestAnimationFrame) window.requestAnimationFrame = function(fn){return setTimeout(fn,15-Math.floor((+new Date)/1000)%16)};
	if(!window.cancelAnimationFrame) window.cancelAnimationFrame = clearTimeout;
})();

(function($){
	/*
	 * site settings
	 * ---------------------------------------------------------------------- */
	bq.ui.plugin('navigation',function(options){
		options = $.extend({}, this.defaults, options);
		var clickEvent = ('ontouchstart' in window)? 'touchstart.navigation' : 'click.navigation';
		var $b = $('body');
		var $t = $(options.target+' '+options.btn);
		var $n = $($t.attr('href'));
		$n.find('li>a+span').click(function(e){
			$(this).parent().toggleClass('open');
			e.preventDefault();
			e.stopPropagation();
			return false;
		})
		function clickHandler(e){
			// if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			//  return;
			// }
			e.preventDefault();
			e.stopPropagation();

			var $target = $(options.target)

			var $t = $(this);
			var $p = $t.closest(options.target);
			var $n = $($t.attr('href'));
			// if($b.hasClass(options.bodyOepnClass) && !$p.hasClass(options.oepnClass)){
			// 	var id = $target.filter('.'+options.oepnClass).attr('id');
			// 	$b.removeClass(options.bodyOepnClass+' '+id+'-'+options.bodyOepnClass);
			// 	$target.filter('.'+options.oepnClass).find(options.btn).trigger(clickEvent);
			// }

			var id = $p.attr('id');

			if(!$p.hasClass(options.oepnClass)){
				// $(document).on(clickEvent+'.close', function(e){
				// 	if($(e.target).closest(options.cancelClick).length){
				// 		return;
				// 	}
				// 	$(document).off(clickEvent+'.close');
				// 	$t.trigger(clickEvent+'.open');
				// })
				$p.addClass(options.oepnClass);
				$n.addClass(options.oepnClass);
				$b.addClass(options.bodyOepnClass+' '+id+'-'+options.bodyOepnClass);
			}else{
				$b.removeClass(options.bodyOepnClass+' '+id+'-'+options.bodyOepnClass);
				$n.removeClass(options.oepnClass);
				$p.removeClass(options.oepnClass);
				// $(document).off(clickEvent+'.close');
			}
		}

		$(document).on(clickEvent+'.open', options.target+' '+options.btn, clickHandler);
		$(options.target+' '+options.btn).hover(function(){
			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			 return;
			}
			console.log('H')
			var $t = $(this);
			var $p = $t.closest(options.target);
			var $n = $($t.attr('href'));
			var id = $p.attr('id');
			if(!$p.hasClass(options.oepnClass)){
				// $(document).on(clickEvent+'.close', function(e){
				// 	if($(e.target).closest(options.cancelClick).length){
				// 		return;
				// 	}
				// 	$(document).off(clickEvent+'.close');
				// 	$t.trigger(clickEvent+'.open');
				// })
				$p.addClass(options.oepnClass);
				$n.addClass(options.oepnClass);
				$b.addClass(options.bodyOepnClass+' '+id+'-'+options.bodyOepnClass);
			}
		},function(){});

		this.closeMenu = function(){
			// var $t = $(options.target).filter('.'+options.oepnClass);
			// if($t.length == 0) return;
			// $t.find(options.btn).trigger(clickEvent);
		};


	},{
		target : '.nav',
		btn : '.nav-btn a',
		oepnClass : 'nav-open',
		bodyOepnClass : 'nav-open',
		cancelClick : ' #wrap > #contact .section.section-tabled'
	});
	bq.ui.autoload('navigation',true);


	bq.ui.plugin('langnavi',function(options){
		options = $.extend({}, this.defaults, options);

		this.reset = function(){
			var $nav = $(options.target_items);
			if($nav.length == 0) return;
			var $target = $(options.target).find('[lang]'),
				lang = $.cookie('lang');

			lang = (lang == undefined || lang == 'undefined')? $nav.filter('.'+options.currentClass).attr('lang') : lang;
			$.cookie('lang', lang, {expires: 14, path: '/'});
			$target.not('[lang="'+lang+'"]').fadeOut(0);
			$target.filter('[lang="'+lang+'"]').fadeIn(500);
			$nav.removeClass(options.currentClass);
			$nav.filter('[lang="'+lang+'"]').addClass(options.currentClass);

			$nav.off('click.langnavi').on('click.langnavi', function(){
				if($(this).hasClass(options.currentClass)) return false;
				$nav.removeClass(options.currentClass);
				lang = $(this).addClass(options.currentClass).attr('lang');
				$.cookie('lang', lang, {expires: 14, path: '/'});
				$target.not('[lang="'+lang+'"]').fadeOut(500).promise().done(function(){
					$target.filter('[lang="'+lang+'"]').fadeIn(500);
				});

				return false;
			});
		};

		this.reset();

	},{
		target : '.content .section',
		target_items : '.lang-nav a',
		currentClass : 'current'
	});
	bq.ui.autoload('langnavi',true);






	

	// startup
	$(function(){
		var $b = $('body');

		if($.browser.mobile){
			$('html').addClass('mobile')
		}

		bq.ui.autoload([
			'rollOver',
			'fadeOver',
			'fadeRollOver',
			//'externalLink',
			'popup',
			//'smoothScroll',
			'formUtils'
		], false);

		$.easing.def = $.bez([.68,0,.42,1]);
		bq.ui.config({
			smoothScroll : {
				offset : 40,
				speed : 1000,
				easing : $.easing.def,
				nonScrollClass: 'non_scroll):not(.nav-btn a'
			}
		});

		bq.ui.init();


		$('.sub-nav-links').mCustomScrollbar({
			theme: 'sub-nav',
			scrollbarPosition: 'outside',
			live: 'on'
		});

		$(window).on('resize',function(){
			var ww = $(this).width();
			if(ww < 560){
				$b.addClass('cnav-collapse')
			}else{
				$b.removeClass('cnav-collapse')
			}
		}).trigger('resize');


		$(document).on({
			mouseover: function(){
				if($b.hasClass('cnav-collapse')) return;
				$(this).closest('.nav-links').find('.sub-nav-links').css('display','none');
				var $t = $(this).find('.sub-nav-links')
				if($t.length){
					$t.css('display','')
				}
			},
			mouseout: function(){
				if($b.hasClass('cnav-collapse')) return;
				$(this).closest('.nav-links').find('.sub-nav-links').css('display','none');
				$('.nav-links:has(.sub-nav-links) > ul > .current').trigger('mouseover');
			}
		}, '.nav-links:has(.sub-nav-links) > ul > li');

		$('.nav-links:has(.sub-nav-links) .sub-nav-links').css('display','none');
		$('.nav-links:has(.sub-nav-links) > ul > .current').trigger('mouseover');

		var clickEvent = ('ontouchstart' in window)? 'touchstart.cnav-links.bq' : 'click.cnav-links.bq'
		$(document).on(clickEvent,'#cnavi-links > ul > li > a', function(){
			if(!$(this).closest('li').hasClass('current')){
				$(this).closest('#cnavi-links').removeClass('has-sub-nav-links').find('.current').removeClass('current');
				$(this).closest('li').addClass('current');
				$('#cnavi-links:has(> ul > .current .sub-nav-links)').addClass('has-sub-nav-links');
			}
		});
		$(document).on(clickEvent,'#cnavi-links .sub-nav-links a', function(){
			if(!$(this).hasClass('current')){
				$(this).closest('#cnavi-links').addClass('has-sub-nav-links').find('.current').removeClass('current');
				$(this).closest('.sub-nav-links').closest('li').addClass('current');
				$(this).addClass('current');
			}
		});

		// $(document).on(clickEvent, '#cnavi-links > ul > li:has(.sub-nav-links) > a', function(){
		// 	if(!$b.hasClass('cnav-collapse')) return;
		// 	$('#cnavi-links > ul > li .sub-nav-links').removeClass('collapse-in');
		// 	var $t = $(this).closest('li');
		// 	$('#cnavi-links > ul').animate({scrollTop : $t.position().top},500)
		// 	$t.find('.sub-nav-links').toggleClass('collapse-in')
		// 	return false;
		// });
		$('.nav-links:has(.sub-nav-links) > ul > .current > a').trigger(clickEvent);



	});

})(jQuery);

(function($){

	function Progress(bar, options){
		this.$bar = $(bar);
		this.options = $.extend({
			min : 0,
			max : 100,
			time : 500,
			autoComplate : true,
			resetOnComplete: true
		},options);
		this.reset();
	}

	Progress.prototype.reset = function(){
		this.p = this.options.min;
		this.$bar.parent().removeClass('show');
		this.started = false;
	};

	Progress.prototype.progress = function(val, callback){
		if(!this.started){
			this.started = true;
			this.$bar.width(0);
			this.$bar.parent().addClass('show');
		}
		this.p = Math.max(Math.min(val, this.options.max), this.options.min);
		if(this.options.autoComplate && this.p == this.options.max){
			this.complete(callback);
		}else{
			this.$bar.stop(true,false).animate({width:(this.p/this.options.max*100)+'%'},this.options.time,$.easing.def);
			if(callback) this.$bar.promise().done(function(){
				callback();
			})
		}
	};

	Progress.prototype.complete = function(callback){
		var self = this;
		this.p = this.options.max;
		this.$bar.stop(true,false).animate({width:'100%'},this.options.time,$.easing.def).promise().done(function(){
			if(self.options.resetOnComplete) self.reset();
			if(callback) callback();
		})
	};

	var support = {};
	support.transitionend = (function(s){
		if(!s) return false;
		var transitions = {
			'transition':'transitionend',
			'OTransition':'oTransitionEnd',
			'MozTransition':'transitionend',
			'WebkitTransition':'webkitTransitionEnd'
		}
		if(transitions[Modernizr.prefixed('transition')]) return transitions[Modernizr.prefixed('transition')];
		return false;
	})(Modernizr.csstransitions);

	if(support.transitionend){
		$.event.special[support.transitionend] = {
			bindType: support.transitionend,
			delegateType: support.transitionend,
			handle: function (e) {
				if ($(e.target).is(this)) return e.handleObj.handler.apply(this, arguments)
			}
		}
	}


	var pageFx = {

		apply: function(prev, next, $new_content, params){
			var dfd = $.Deferred(),
				bfx = prev + ' --> *',
				fx = prev+' --> '+next,
				nfx = '* --> '+next,
				all = '* --> *',
				q = $.Queue();

			if(fx in this.fx){
				q.append(this.fx[fx](prev, next, $new_content, params));
			}else if(bfx in this.fx){
				q.append(this.fx[bfx](prev, next, $new_content, params));
			}else if(nfx in this.fx){
				q.append(this.fx[nfx](prev, next, $new_content, params));
			}else if(all in this.fx){
				q.append(this.fx[all](prev, next, $new_content, params));
			}

			q.promise.done(function(){
				dfd.resolve();
			})

			return dfd.promise();
		},

		fx: {
			'* --> *' : defaultFx,
		}
	};

	function defaultFx(prev, next, $new_content, params){
		return function(){

			var self = this;
			var $b = $('body');

			var complete = function(e){
				if(e.target !== e.currentTarget) return;

				$prev.off(support.transitionend).trigger('remove.page.bq').remove();
				$next.css('height','').removeClass('show');


				self.resolve();
			};

			var $prev = $('#'+prev, $b),
				$next = $new_content.find('#'+next);

			

			if(support.transitionend){
				// $next.css(Modernizr.prefixedCSS('transform'),'translate(0,'+$(window).height()+'px)').addClass('show');
				$prev.after($next);

				resetNavigation(prev, next, $new_content);
				setTimeout(function(){
					// var x = $next.get(0).clientHeight;
					$next.css(Modernizr.prefixedCSS('transform'),'');
				}, 0);

				$prev.addClass('moveUp').remove()
				// $prev.on(support.transitionend, complete);
				complete({})
			}else{
				$next.css(Modernizr.prefixedCSS('transform'),'translate(0,'+$(window).height()+'px)').addClass('show');
				$prev.after($next);
				resetNavigation(prev, next, $new_content);
				$prev.addClass('moveUp')
				setTimeout(complete, 1100);
				// complete({})
			}

			$('[ui-yield-to]').each(function(){
				var ui_yield_to = $(this)
				var uiid = ui_yield_to.attr('ui-yield-to');
				var ui_content_for = $new_content.find('[ui-content-for="' + uiid + '"]')
				ui_yield_to.empty().append(ui_content_for);
				// var ui_content_for_prev = ui_yield_to.find('[ui-content-for="' + uiid + '"]');
				// var ui_animate_out = ui_content_for_prev.attr('ui-animate-out');
				// var ui_animate_in = ui_content_for.attr('ui-animate-in');
				// var ui_animate = ui_yield_to.attr('ui-animate');
				// if(ui_animate_out){
				// 	ui_content_for_prev.addClass(ui_animate_out + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				// 		ui_yield_to.append(ui_content_for);
				//       	ui_content_for_prev.remove()
				//       	if(ui_animate_in){
				// 		    ui_content_for.addClass(ui_animate_in + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				// 		    	ui_content_for.removeClass(ui_animate_in + ' animated')
				// 		    });
				//       	}
				//     });
				// } else if(ui_animate){
				// 	ui_yield_to.append(ui_content_for);
			 //      	ui_content_for_prev.remove()
				// 	ui_content_for.addClass(ui_animate + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				//     	ui_content_for.removeClass(ui_animate + ' animated')
				//     });
				// } else {
				// 	ui_yield_to.append(ui_content_for);
				// 	ui_content_for_prev.remove()
				// }
			})
		}
	}

	function resetNavigation(prev, next, $new_content){

		// $('#menu').empty().append($new_content.find('#menu').children());
		// var new_gnav_label = $new_content.find('#gnavi .label').text();
		// $('#gnavi .label').fadeTo(250, 0, function(){
		// 	$(this).text(new_gnav_label);
		// 	$(this).fadeTo(250, 1);
		// });

		if($('#cnavi').length){
			var new_cnav_label = false;
			if($new_content.find('#cnavi .label').length){
				new_cnav_label = $new_content.find('#cnavi .label').html();
			}
			$('#cnavi').fadeOut(250, function(){
				if(new_cnav_label !== false){
					$(this).find('.label').html(new_cnav_label);
					$(this).fadeIn(250);
				}
			});
		}else if($new_content.find('#cnavi').length){
		// 	$('#gnavi').after($new_content.find('#cnavi').fadeOut(0));
		// 	$('#cnavi').delay(250).fadeIn(250);
		}

		// bq.ui.langnavi.reset();
		// $('.nav-links:has(.sub-nav-links) .sub-nav-links').css('display','none');
		// $('.nav-links:has(.sub-nav-links) > ul > .current').trigger('mouseover');

	}






	var processQueue = $.Queue(),
		_requests = [],
		prev = null,
		current = null,
		progress,
		cancel = false;

	function pageExit(prev_ctx, next, next_ctx){
		
		prev = prev_ctx;
		console.log('pageExit');

		$(window).trigger('exit.page.bq');
		bq.ui.navigation.closeMenu();
		next();
	}


	function pageEnter(ctx, next){
		if(cancel){ cancel = false; return;	}

		console.log('pageEnter');
		if(ctx.init){
			current = ctx;
			$(function(){
				$(window).trigger('enter.page.bq');
			});
			return;
		}

		_addRequestQueue({from: prev, to: ctx});
		processQueue.append(pageChange);
	}

	function pageChange(){
		var params = _getRequestQueue(), q = this;
		if(params == false) return this.resolve();

		$('body').addClass('page-loading');

		if(!progress) progress = _createProgress();
		var dfd = $.Deferred();


		$(document).on('scroll.page.bq mousewheel.page.bq',function(){return false;})

		progress.progress(0);
		$.when(
			$.get(params.to.path),
			_scrollToTop()
		).done(function(res){
			_showPage(res[0], params).done(dfd.resolve);
			current = params.to;
		});


		dfd.done(this.resolve);
	}

	function _scrollToTop(){
		if($(window).scrollTop() > 0){
			return $(/(webkit)[ \/]([\w.]+)/i.test(navigator.userAgent)?"body":"html").delay(500).animate({scrollTop:0},500).promise();
		}else{
			return wait(500);
		}
	}

	function wait(time){
		var dfd = $.Deferred();
		setTimeout(function(){
			dfd.resolve();
		},500);
		return dfd.promise();
	}

	function _showPage(res, params){
		var dfd = $.Deferred();
		var $new_content = _perseHTML(res);
		var title = res.match(/<title>(.*)<\/title>/)[1];

		var prev = $('#contents > .content').attr('id'),
			next = $new_content.find('#contents > .content').attr('id');

		pageFx.apply(prev, next, $new_content, params).done(function(){
			$(window).trigger('enter.page.bq');
			$('title').text(title);

			$(document).off('scroll.page.bq mousewheel.page.bq')
			dfd.resolve();
		});

		progress.complete(function(){
			$('body').removeClass('page-loading');
		});

		return dfd.promise();
	}

	function _createProgress(){
		var $bar = $('<div class="bar" />');
		$('<div id="loading-progress" class="progress" />').append($bar).prependTo('body');
		return new Progress($bar);
	}

	function _perseHTML(data){
		var folder =  document.createElement('div');
		folder.innerHTML = data;
		return $(folder);
	}

	function _getRequestQueue(){
		if(_requests.length == 0) return false;
		var params = _requests[_requests.length-1];
		_requests = [];
		return params;
	}

	function _addRequestQueue(params){
		_requests[_requests.length] = params;
	}

	function notFound(){
	}


	// var contactData = {
	// 		clickEvent : ('ontouchstart' in window)? 'touchstart.page.contact' : 'click.page.contact'
	// 	},
	// 	$contactLoading = $.get('/contact').done(function(res){
	// 		contactData.title = res.match(/<title>(.*)<\/title>/)[1];
	// 		var $c = _perseHTML(res).find('#contents > .content')
	// 		$c.removeClass('content').addClass('overlay');
	// 		$c.find('.lang-nav').remove();
	// 		contactData.content =  $c;
	// 		$('#wrap').append($c);
	// 	});

	// function contactEnter(ctx, next){
	// 	if(ctx.init) return next();

	// 	if($contactLoading.state() != 'resolved'){
	// 		$contactLoading.done(_showContact);
	// 	}else{
	// 		_showContact()
	// 	}
	// 	$('#menu a[href="/contact"]').addClass('current');
	// 	if($('body').hasClass('cnav-collapse')){
	// 		bq.ui.navigation.closeMenu();
	// 	}
	// }

	// function contactExit(prev_ctx, next, next_ctx){
	// 	$(document).off(contactData.clickEvent+'.close');
	// 	contactData.content.removeClass('show');
	// 	setTimeout(function(){
	// 		next();
	// 	},500);
	// 	$('#menu a[href="/contact"]').removeClass('current');
	// }

	// function _showContact(){
	// 	contactData.content.addClass('show');
	// 	$('title').text(contactData.title);

	// 	$(document).on(contactData.clickEvent+'.close', function(e){
	// 		if($(e.target).closest(bq.ui.navigation.defaults.cancelClick).length){
	// 			return;
	// 		}
	// 		$(document).off(contactData.clickEvent+'.close');
	// 		bq.page.back()
	// 	})
	// }



	// bq.page.exit('/contact', contactExit);
	// bq.page('/contact', contactEnter);

	// bq.page.exit('*', pageExit);
	// bq.page('*', pageEnter);

	// bq.page();


	// $(document).on('click','a:not(.external)',function(e){
	// 	if($(this).hasClass('current')){
	// 		e.preventDefault();
	// 	}
	// 	if(!bq.page.sameOrigin(this.href)){
	// 		//e.preventDefault();
	// 		//window.open(this.href,'_blank');
	// 		//return false;
	// 	}
	// });


})(jQuery)