as yet unclassified
addMenuFor: aFigure
	| menu |
	menu := PluggableMenuSpec new model: aFigure.
	menu add: 'Browse' action: (MessageSend receiver: aFigure model selector: #browse).
	menu
		add: 'Senders'
		target: self
		selector: #addSendersFor:
		argumentList: {aFigure}.
	aFigure when: TRMouseRightClick do: [ :event | menu asMenuMorph popUpInWorld ]