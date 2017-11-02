as yet unclassified
example1
	<playground>
| inst builder model v el |
inst := OPUmlStyle new fontSize: 11; fontUnderline: true.

builder := LIVInstanceSpecificationBuilder new.
builder name: nil.
builder addFromAssociation: #fontSize -> #fontSize.
builder addFromAssociation: #fontUnderline -> #fontUnderline.

model := builder instanceOn: inst.

v := RTView new.
el := model asShape.
el renderIn: v.
el rtElement when: TRMouseLeftClick do: [ :evt |  ].
el rtElement @ RTResizable @ RTDraggable.
v