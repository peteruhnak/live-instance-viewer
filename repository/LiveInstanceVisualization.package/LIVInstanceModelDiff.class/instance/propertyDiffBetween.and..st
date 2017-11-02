as yet unclassified
propertyDiffBetween: anOldInstance and: aNewInstance
	| added removed same modified |
	added := aNewInstance slots keys \ anOldInstance slots keys.
	removed := anOldInstance slots keys \ aNewInstance slots keys.
	modified := Set new.
	same := aNewInstance slots keys intersection: anOldInstance slots keys.
	same
		do: [ :key | 
			| oldValue newValue |
			oldValue := anOldInstance slots at: key.
			newValue := aNewInstance slots at: key.
			(oldValue = newValue
				or: [ ((oldValue isKindOf: LIVInstanceSpecification)
						and: [ newValue isKindOf: LIVInstanceSpecification ])
						and: [ oldValue instanceHash = newValue instanceHash ] ])
				ifFalse: [ modified add: key ] ].
	^ Dictionary
		with: #added -> (aNewInstance slots associationsSelect: [ :pair | added includes: pair key ])
		with:
			#removed
				-> (anOldInstance slots associationsSelect: [ :pair | removed includes: pair key ])
		with:
			#modified
				-> (aNewInstance slots associationsSelect: [ :pair | modified includes: pair key ])