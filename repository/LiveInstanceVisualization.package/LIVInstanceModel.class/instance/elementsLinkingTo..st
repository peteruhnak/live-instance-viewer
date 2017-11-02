accessing
elementsLinkingTo: anInstance
	^ elements
		select: [ :each | 
			each slots associations
				anySatisfy: [ :assoc | 
					assoc value isCollection
						ifTrue: [ assoc value includes: anInstance ]
						ifFalse: [ assoc value = anInstance ] ] ]