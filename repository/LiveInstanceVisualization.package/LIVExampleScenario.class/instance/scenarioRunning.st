as yet unclassified
scenarioRunning
| container item1 item2 |
container := LIVTestContainer new.
item1 := LIVTestItem new.
item1 name: 'item1'.
container addItem: item1.
item1 container: container.

item2 := LIVTestItem new name: 'item2'.
container addItem: item2.
item2 container: container.

item1 container: nil.
container removeItem: item1.