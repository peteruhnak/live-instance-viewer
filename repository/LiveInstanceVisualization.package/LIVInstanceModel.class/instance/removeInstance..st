removing
removeInstance: anInstance
	(self elementsLinkingTo: anInstance) ifNotEmpty: [ ^ self ].
	elements remove: anInstance