<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script>
	$(function(){
		$("#standing")
			.find("table")
				.find("tr").each(function(index){
					
					var $this = $(this);
					if(2 >=  index || $this.hasClass("yspsctbg") ){
						$this.remove();
					}
					$("tr.ysptblthbody1").each(function(index){
						if(0 < index ) {
							//$(this).remove();
						}
					});
					if( $this.hasClass("ysprow1") || $this.hasClass("ysprow2") || $this.hasClass("ysptblthbody1") ) {
						
						$this
							.find("td")
								.eq(4).remove().end()
								.eq(5).remove().end()
								.eq(6).remove().end()
								.eq(7).remove().end()
								.eq(8).remove().end()
								.eq(9).remove().end()
								.eq(10).filter(function(){
									if( "Won" == $(this).text().substring(0, 3) ) {
										$(this).css("background-color", "yellow");
									}
								});
							
					}
				});
	});
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
		  <div class="span4" id="standing">${streak }</div>
		  <div class="span8">${tbl }</div>
	</div>
	</div>
</body>
</html>
