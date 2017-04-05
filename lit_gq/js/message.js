// 评论页
	$("#com").fadeIn();
	$("#messagePage .head").on('click', function(e) {
	    var t = e.target;
	    var $t = $(t);
	    var $this = $(this);
	    if ($t.is('.back')) {
	    	window.history.go(-1);
	    }else if ($t.is('.refresh')) {
	    	window.location.reload();
	    }
	});
	$("#navCom").on('click', function(e) {
    	fnSwitchOn($(this));
    	$("#com").fadeIn();
	});
	$("#navAgr").on('click', function(e) {
    	fnSwitchOn($(this));
    	$("#agr").fadeIn();
	});
	$("#navSys").on('click', function(e) {
    	fnSwitchOn($(this));
    	$("#sys").fadeIn();
	});
	function fnSwitchOn(obj){
		obj.closest('tr').find('a').each(function() {
    		$(this).removeClass('on');
    	});
    	obj.addClass('on');
    	$(".sec").each(function() {
    		$(this).hide();
    	});
	}
