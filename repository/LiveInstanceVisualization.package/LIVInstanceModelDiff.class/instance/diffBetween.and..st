as yet unclassified
diffBetween: anOldModel and: aNewModel
	| oldHashes newHashes removed added modified propertyDiff |
	oldHashes := anOldModel elements collect: #instanceHash.
	newHashes := aNewModel elements collect: #instanceHash.
	removed := oldHashes \ newHashes.
	added := newHashes \ oldHashes.
	modified := oldHashes intersection: newHashes.
	propertyDiff := Dictionary new.
	modified
		do: [ :each | 
			propertyDiff
				at: each
				put:
					(self
						propertyDiffBetween: (anOldModel elements detect: [ :e | e instanceHash = each ])
						and: (aNewModel elements detect: [ :e | e instanceHash = each ])) ].
	^ Dictionary
		with: #added -> (aNewModel elements select: [ :each | added includes: each instanceHash ])
		with: #modified -> propertyDiff
		with: #removed -> (anOldModel elements select: [ :each | removed includes: each instanceHash ])