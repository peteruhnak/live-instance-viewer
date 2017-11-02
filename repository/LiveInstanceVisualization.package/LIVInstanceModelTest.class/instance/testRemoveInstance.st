tests - removing
testRemoveInstance
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model addLinkFrom: container to: item at: #items.
	model removeLinkFrom: container to: item at: #items.
	self assert: model elements asArray equals: {model specificationFor: container}