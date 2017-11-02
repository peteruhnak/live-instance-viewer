building
liveViewIn: composite forContext: aContext
	| history |
	history := self class sessionClass modelHistory.
	history ifNil: [ ^ self ].
	history models ifEmpty: [ ^ self ].
	(history models last gtInspectorModelViewIn: composite)
		onChangeOfPort: #selection act: [ :historyPresentation | 
			self inspect: historyPresentation selection ]