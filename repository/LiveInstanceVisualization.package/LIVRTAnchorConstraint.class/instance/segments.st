accessing
segments
	(edge shape isKindOf: OPRTConnection)
		ifTrue: [ ^ LIVRTPolyLineSegment withAll: (self connectionSegmentsFor: edge) ].
	(edge shape isKindOf: RTBezierLine)
		ifTrue: [ ^ self notYetImplemented ].
	^ LIVRTPolyLineSegment with: (self lineSegmentFor: edge)