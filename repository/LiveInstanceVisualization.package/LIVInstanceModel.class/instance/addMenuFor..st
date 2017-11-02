roassal - drawing
addMenuFor: aFigure
	| menu |
	menu := PluggableMenuSpec new model: aFigure.
	menu
		add: 'Remove'
		target: aFigure
		selector: #remove
		argumentList: #().
	aFigure rtElement when: TRMouseRightClick do: [ :event | menu asMenuMorph popUpInWorld ]