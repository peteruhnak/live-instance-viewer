as yet unclassified
addSendersFor: aFigure
	| senders b els |
	senders := aFigure model senders
		reject: [ :meth | mondrian view elements anySatisfy: [ :each | each model = meth ] ].
	b := mondrian.
	b shape text
		color: Color black;
		text: [ :each | each method name ].
	els := b nodes: senders.
	els do: [ :each | self addMenuFor: each ].
	b shape horizontalBezierLine color: Color blue.
	b shape arrowedBezier
		head: RTEmptyArrowHead new;
		color: Color blue.
	b edges connectFromAll: [ :s | senders ] to: [ :s | aFigure model ].
	b layout horizontalDominanceTree
		verticalGap: 40;
		horizontalGap: 70.
	b build