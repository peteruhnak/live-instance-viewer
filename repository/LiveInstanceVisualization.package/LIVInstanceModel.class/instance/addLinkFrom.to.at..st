adding
addLinkFrom: sourceObject to: targetObject at: aSlot
	((self ensureInstanceFor: sourceObject) slots at: aSlot)
		add: (self ensureInstanceFor: targetObject)