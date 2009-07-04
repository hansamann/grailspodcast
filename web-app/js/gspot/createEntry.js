
var loader = new YAHOO.util.YUILoader
({
    require: ["yahoo", "logger", "simpleeditor"],
    loadOptional: true,
    onSuccess: function() {
		YAHOO.util.Event.onDOMReady(init);    
    }
});

loader.insert();

function init()
{ 
   	YAHOO.widget.Logger.enableBrowserConsole();
   	YAHOO.namespace("gspot");
   	YAHOO.log('init()');
   	
	var myEditor = new YAHOO.widget.SimpleEditor('content', {
	    height: '300px',
	    width: '522px',
	    dompath: true, //Turns on the bar at the bottom
	    animate: true, //Animates the opening, closing and moving of Editor windows
	    handleSubmit : true
	});
	
myEditor.render();   	
   
		
	 
}


