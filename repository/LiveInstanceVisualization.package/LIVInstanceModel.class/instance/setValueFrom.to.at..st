adding
setValueFrom: aSourceObject to: aTargetObject at: aSlot
	(self ensureInstanceFor: aSourceObject) slots at: aSlot put: aTargetObject