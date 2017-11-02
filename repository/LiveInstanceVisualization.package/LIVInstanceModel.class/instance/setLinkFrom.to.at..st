adding
setLinkFrom: sourceObject to: targetObject at: aSlot
	(self ensureInstanceFor: sourceObject) slots
		at: aSlot
		put: (self ensureInstanceFor: targetObject)