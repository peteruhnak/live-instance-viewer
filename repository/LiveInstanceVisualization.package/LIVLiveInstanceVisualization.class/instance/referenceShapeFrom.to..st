as yet unclassified
referenceShapeFrom: aSourceShape to: aTargetShape
	^ OPUmlEdge new
		source: aSourceShape;
		target: aTargetShape;
		modelElement: aSourceShape modelElement -> aTargetShape modelElement;
		yourself