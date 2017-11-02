building
modelHistoryIn: composite forContext: aContext
	| history |
	history := self class sessionClass modelHistory.
	history ifNil: [ ^ self ].
	history gtInspectorModelViewIn: composite