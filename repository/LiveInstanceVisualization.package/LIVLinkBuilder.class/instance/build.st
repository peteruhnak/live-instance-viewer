as yet unclassified
build
	| edge |
	edge := OPUmlEdge new
		source: source;
		target: target;
		modelElement: source modelElement -> target modelElement;
		yourself.
	edge headDecorator: RTSimpleArrow.
	^ edge