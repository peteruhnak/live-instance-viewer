building
transmitFromStackToCodeIn: browser
	super transmitFromStackToCodeIn: browser
"	browser transmit
		from: #stack port: #selection;
		to: #code;
		andShow: [ :composite :aContext | 
			self methodCodeIn: composite forContext: aContext.
			self liveViewIn: composite forContext: aContext]"