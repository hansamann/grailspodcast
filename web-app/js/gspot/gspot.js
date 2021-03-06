
var loader = new YAHOO.util.YUILoader
({
    require: ["logger", "yahoo", "event", "dom", "element", "container", "connection", "json", "reset", "fonts", "grids", "base"],
    loadOptional: true,
    onSuccess: function() {
		YAHOO.widget.Logger.enableBrowserConsole();
		YAHOO.util.Event.onDOMReady(init);
    }
});

loader.insert();

//freaky, if you remove it del.icio.us dies.
var SvgColors = {};


function init()
{
	YAHOO.log('init()');
   	YAHOO.namespace("gspot");

   	//load flickr images
   	loadFlickrImages();


   	//load weather from server
   	YAHOO.gspot.base = '';


   	var url = '/common/dynamic';
   	var weatherTransaction = YAHOO.util.Connect.asyncRequest('GET', YAHOO.gspot.base + url,
	{
		success: function(o)
	  	{
	  		YAHOO.log(o.responseText);
	  		var data = YAHOO.lang.JSON.parse(o.responseText);
	  		YAHOO.log(data);

	  		createWeatherHeader(data);
            createNowHeader(data);
	  		setColor(data);

	  		//test
	  		//YAHOO.gspot.colorTimer = YAHOO.lang.later (2000, null , testBackground , null , true );
  		},
	  	failure: function(o)
	  	{
	  		YAHOO.log('Error getting weather!');
  		}
	}, null);

	YAHOO.util.Event.addListener('searchBox', 'mouseover', searchBoxOver);
	YAHOO.util.Event.addListener('searchBox', 'mouseout', searchBoxOut);
	YAHOO.util.Event.addListener('searchBox', 'keydown', search);




}



function searchBoxOver(event)
{
	if (this.value == 'search term')
		this.value = '';
}

function searchBoxOut(event)
{
	if (this.value == '')
		this.value = 'search term';
}

function search(event)
{
	if(event.keyCode == 13) //enter
	{
		if (this.value.length == 0)
			return;

		var bossBase = 'http://boss.yahooapis.com/ysearch/web/v1/';
		var searchTerm = escape(this.value);
		var queryAndAppId = '?appid=hmNIpqzV34GgFhD60AgJiVe07VOtNMxJbOAodftNZWUYB4wu6mJP0nCkEi3GtNhq';
		var format = '&format=json';
		var count = '&count=10';

		var sitesArray = ['grailspodcast.com', 'gspot.morphexchange.com'];
		var sites = '&sites=' + sitesArray.join(',');
		var callback = '&callback=processSearchResult';

		var requestURL = bossBase + searchTerm + queryAndAppId + format + count + sites + callback;
		var transaction = YAHOO.util.Get.script(requestURL);
	}
}

function processSearchResult(result)
{
	var html = '';

	for (pos in result.ysearchresponse.resultset_web)
	{
		var r = result.ysearchresponse.resultset_web[pos];
		html+= buildResultEntry(r);
	}

	YAHOO.util.Dom.get('content').innerHTML = html;
}

function buildResultEntry(r)
{
	var html = '<div class="entry">';
	html += '<div class="title"><a href="'+r.clickurl+'">' + r.title + '</a></div>';
	html += '<div class="content">' + r.abstract + '</div>';
	html += '<div class="enclosure"><a href="'+r.clickurl+'">'+r.dispurl+'</a></div>';
	html += '</div>';
	return html;
}

function testBackground()
{
	if (!YAHOO.gspot.temp && YAHOO.gspot.temp !== 0)
	{
		YAHOO.gspot.temp = -15;
	}
	id('weatherHeader').innerHTML = YAHOO.gspot.temp;
	setColor({nowTemp:YAHOO.gspot.temp});
	YAHOO.gspot.temp++;

	if (YAHOO.gspot.temp > 45)
	{
		YAHOO.gspot.colorTimer.cancel();
	}
}

function loadFlickrImages()
{
	//photos for tags only: http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0bea16f3534a51da590afa716d97f720&tags=grails,groovy,grailspodcast&content_type=1&per_page=20&format=json
//	var flickrURL = 'http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0bea16f3534a51da590afa716d97f720&user_id=21008288@N00&content_type=1&per_page=20&format=json';
	var flickrURL = 'http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0bea16f3534a51da590afa716d97f720&tags=grailspodcast,2gx&content_type=1&per_page=20&format=json';
	var objTransaction = YAHOO.util.Get.script(flickrURL);
}

function jsonFlickrApi(data)
{
	YAHOO.log('jsonFlickrApi');
	YAHOO.log(data);
	var html = '';
	var counter = 0;
	for (pos in data.photos.photo)
	{
		var photo = data.photos.photo[pos];
		var photoURL = getFlickrPhotoURL(photo);
		//html += '<a href="http://www.flickr.com/photos/21008288@N00/' + photo.id + '">';
		html += '<a href="http://www.flickr.com/photos/'+photo.owner+'/' + photo.id + '">';
		if (counter % 2 == 0)
		{
			html += '<img src="' + photoURL + '" class="flickrImage" width="75" height="75" />';
		}
		else
		{
			html += '<img src="' + photoURL + '" class="flickrImageRight" width="75" height="75" />';
		}
		html += '</a>';
		counter++;
	}

	id('flickr').innerHTML = html;
}

function getFlickrPhotoURL(photo)
{
	return 'http://farm'+photo.farm+'.static.flickr.com/'+photo.server+'/'+photo.id+'_'+photo.secret+'_s.jpg';
}

function createWeatherHeader(weather)
{
	YAHOO.log('createWeatherHeader()');
	//Now: Partly Cloudy, 17�C - Mon: Mostly Sunny, L11/H21�C - Sunrise/Sunset: 5:52 am/ 8:19 pm
	var weatherHeader = "Sunnyvale, CA &middot; ";
	weatherHeader += weather.nowCondition + ', ' + weather.nowTemp + '&deg;C &middot; ';
	weatherHeader += weather.tomorrow.day + ': ' + weather.tomorrow.condition + ', L' + weather.tomorrow.low + '/H' + weather.tomorrow.high + '&deg;C &middot; ';

	var sunriseM = parseInt(weather.sunrise.minute, 10);
	var sunsetM = parseInt(weather.sunset.minute, 10);
	sunriseM = (sunriseM > 9) ? sunriseM : '0' + sunriseM;
	sunsetM = (sunsetM > 9) ? sunsetM : '0' + sunsetM;
	weatherHeader += 'Sunrise: ' + weather.sunrise.hour + ':' + sunriseM + ' &middot; ';
	weatherHeader += 'Sunset: ' + weather.sunset.hour + ':' + sunsetM;
	id('weatherHeader').innerHTML = weatherHeader;
}

function createNowHeader(data)
{
    YAHOO.log('createNowHeader(): ' + data.now);
    YAHOO.util.Dom.get('now').innerHTML = data.now;
}

function id(id)
{
	return YAHOO.util.Dom.get(id);
}

function setColor(weather)
{
	YAHOO.log('setBackgroundColor() ' + weather.nowTemp + ' / ' + weather.dayOrNight);

	//define color based on temperature
	var t = weather.nowTemp;
	var r = 0, g = 0, b = 0;

	var targetColor;
	if (t <= -10)
	{
		targetColor = {r:0, g:0, b:128};
	}
	else if (t <= 0)
	{
		var leftColor = {r:0, g:0, b:128};
		var rightColor = {r:153, g:204, b:255};
		var position = 10 + t;
		targetColor = calculateColor(leftColor, rightColor, position);
	}
	else if (t <= 10)
	{
		var leftColor = {r:153, g:204, b:255};
		var rightColor = {r:0, g:174, b:0};
		var position = t;
		targetColor = calculateColor(leftColor, rightColor, position);
	}
	else if (t <= 20)
	{
		var leftColor = {r:0, g:174, b:0};
		var rightColor = {r:255, g:255, b:102};
		var position = t - 10;
		targetColor = calculateColor(leftColor, rightColor, position);
	}
	else if (t <= 30)
	{
		var leftColor = {r:255, g:255, b:102};
		var rightColor = {r:255, g:0, b:0};
		var position = t - 20;
		targetColor = calculateColor(leftColor, rightColor, position);
	}
	else if (t <= 40)
	{
		var leftColor = {r:255, g:0, b:0};
		var rightColor = {r:76, g:25, b:0};
		var position = t - 30;
		targetColor = calculateColor(leftColor, rightColor, position);
	}
	else // >40
	{
		targetColor = {r:76, g:25, b:0};
	}

	//add grey shading for day/time



	//set background color
	var rgbString = 'rgb('+targetColor.r+','+targetColor.g+','+targetColor.b+')';
	YAHOO.log(rgbString);
	YAHOO.util.Dom.setStyle(document.body, 'background', rgbString);
	if (weather.dayOrNight === 'night')
	{
		var nightURL = "url('"+YAHOO.gspot.base+"/images/gspot/night.png')";
		YAHOO.util.Dom.setStyle(document.body, 'background-image', nightURL);
	}

	//darker LinkColor
	var darkerColor = {};
	for (pos in targetColor)
	{
		darkerColor[pos] = ((targetColor[pos] - 75) < 0) ? 0 : (targetColor[pos] - 75);
	}

	var darkerRgbString = 'rgb('+darkerColor.r+','+darkerColor.g+','+darkerColor.b+')';
	YAHOO.log('darker: ' + darkerRgbString);

	colorAllLinks(darkerRgbString);

	//run this a few seconds later, too, so all links even onse loaded into the page are the same color
	YAHOO.lang.later(4000, this, colorAllLinks, darkerRgbString, true);
}


function colorAllLinks(rgbString)
{
	YAHOO.log('setting all links to color: ' + rgbString);
	YAHOO.util.Dom.getElementsBy( function(e) { return true; } , 'a' , document.body , function(e) { YAHOO.util.Dom.setStyle(e, 'color', rgbString); } );
}

function calculateColor(leftColor, rightColor, position)
{
	YAHOO.log('calculateColor() ' + leftColor + ' -> ' + rightColor + ' position: ' + position);
	var r = Math.round(leftColor.r + ((rightColor.r - leftColor.r) / 10 * position));
	var g = Math.round(leftColor.g + ((rightColor.g - leftColor.g) / 10 * position));
	var b = Math.round(leftColor.b + ((rightColor.b - leftColor.b) / 10 * position));
	return {r:r, g:g, b:b};
}
