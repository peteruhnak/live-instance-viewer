as yet unclassified
exampleWithHistory
	<playground>
| b1 b2 hist m1 ui m2 m3 m4 m5 uiM bM m6 v from to diff colorer |
b1 := LIVInstanceSpecificationBuilder new.
b1 name: 'source'.

b2 := LIVInstanceSpecificationBuilder new.
b2 name: 'button'.
b2 addFromAssociation: #owner -> nil.

hist := LIVInstanceHistory new.
m1 := LIVInstanceModel new.
hist add: m1.

ui := DynamicComposableModel new.
m2 := LIVInstanceModel new.
m2 add: (b1 instanceOn: ui).
hist add: m2.

ui instantiateModels: #(button ButtonModel).
b1 addFromAssociation: #button -> nil.
m3 := LIVInstanceModel new.
m3 add: (b1 instanceOn: ui).
hist add: m3.

m4 := LIVInstanceModel new.
m4 add: (b1 instanceOn: ui).
m4 add: (b2 instanceOn: ui button).
hist add: m4.

m5 := LIVInstanceModel new.
uiM := b1 instanceOn: ui.
bM := b2 instanceOn: ui button.
uiM slots at: #button put: bM.
m5 add: uiM; add: bM.
hist add: m5.

m6 := LIVInstanceModel new.
uiM := b1 instanceOn: ui.
bM := b2 instanceOn: ui button.
uiM slots at: #button put: bM.
bM slots at: #owner put: uiM.
m6 add: uiM; add: bM.
hist add: m6.

v := RTView new.

from := hist models second.
to := hist models sixth.

diff := LIVInstanceModelDiff new diffBetween: from and: to.

to renderIn: v.

colorer := LIVInstanceDiffColorer new.
colorer colorAll: diff in: v.

v