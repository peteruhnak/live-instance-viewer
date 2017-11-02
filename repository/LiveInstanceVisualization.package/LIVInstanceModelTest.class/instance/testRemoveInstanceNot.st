tests - removing
testRemoveInstanceNot
	| container item |
	container := LIVTestContainer new.
	item := LIVTestItem new.
	model addLinkFrom: container to: item at: #items.
	model removeInstance: (model specificationFor: item).
	self
		assert: model elements asArray
		equals:
			{model specificationFor: container.
			model specificationFor: item}