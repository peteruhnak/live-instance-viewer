as yet unclassified
addMenuFor: aFigure
	| menu |
	menu := PluggableMenuSpec new model: aFigure.
	menu
		add: 'Browse'
		action: (MessageSend receiver: aFigure model selector: #browse).
	aFigure when: TRMouseRightClick do: [ :event | menu asMenuMorph popUpInWorld ]