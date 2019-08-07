<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/audio.css" />
<title>Insert title here</title>
<script type="text/javascript">
$(function() {

	$(".track").each(function(index, el) {
		init($(this));
	});

	function init(card) {
		card.children(".cover").append('<button class="play"></button><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100"><path id="circle" fill="none" stroke="#FFFFFF" stroke-miterlimit="10" d="M50,2.9L50,2.9C76,2.9,97.1,24,97.1,50v0C97.1,76,76,97.1,50,97.1h0C24,97.1,2.9,76,2.9,50v0C2.9,24,24,2.9,50,2.9z"/></svg>');

		var audio = card.find("audio"),
			play = card.find('.play'),
			circle = card.find('#circle'),
			getCircle = circle.get(0),
			totalLength = getCircle.getTotalLength();

		circle.attr({
				'stroke-dasharray': totalLength,
				'stroke-dashoffset': totalLength
		});

		play.on('click', function() {
			if (audio[0].paused) {
				$("audio").each(function(index, el) {
					$("audio")[index].pause();
				});
				$(".track").removeClass('playing');
				audio[0].play();
				card.addClass('playing');
			} else {
				audio[0].pause();
				card.removeClass('playing');
			}
		});

		audio.on('timeupdate', function() {
			var currentTime = audio[0].currentTime,
				maxduration = audio[0].duration,
				calc = totalLength - ( currentTime / maxduration * totalLength );

			circle.attr('stroke-dashoffset', calc);
		});

		audio.on('ended', function() {
			card.removeClass('playing');
			circle.attr('stroke-dashoffset', totalLength);
		});
		
	}

});

</script>

</head>
<body>

<div class="main">
  <ul>
    <li class="track">
      <div class="cover">
        <img src="https://is3-ssl.mzstatic.com/image/thumb/Music6/v4/04/8e/de/048ede2e-0b32-6eb5-c57a-a9665335f743/source/300x300cc.jpg" alt="" />
      </div>
      <div class="info">
        <span class="title">Wake Me Up</span>
        <span class="artist">Avicii</span>
      </div>
      <audio src="https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music4/v4/f0/b8/fa/f0b8fa78-b63b-34df-c4f2-4156a3a83b38/mzaf_6470951130098414732.plus.aac.ep.m4a"></audio>
    </li>
    <li class="track">
       <div class="cover">
        <img src="https://is1-ssl.mzstatic.com/image/thumb/Music/v4/eb/a0/71/eba071e6-2aa6-aa1a-28d9-28a76aa98d03/source/300x300cc.jpg" alt="" />
      </div>
      <div class="info">
        <span class="title">Levels (Radio Edit)</span>
        <span class="artist">Avicii</span>
      </div>
      <audio src="https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music/v4/46/04/73/460473d7-3442-2e68-d2bc-ccee99462df7/mzaf_7423131269069483354.plus.aac.ep.m4a"></audio>
    </li>
  </ul>
</div>

</body>
</html>