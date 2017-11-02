building
debuggerTransmissionsIn: browser
	super debuggerTransmissionsIn: browser.
	browser transmit
		from: #stack port: #selection;
		to: #view;
		andShow: [ :composite :aContext | 
			self liveViewIn: composite forContext: aContext.
			self modelHistoryIn: composite forContext: aContext ]