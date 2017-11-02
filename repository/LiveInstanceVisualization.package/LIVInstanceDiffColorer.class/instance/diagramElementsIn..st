as yet unclassified
diagramElementsIn: aView
	^ aView elements select: [ :each | each model isKindOf: OPUmlDiagramElement ]