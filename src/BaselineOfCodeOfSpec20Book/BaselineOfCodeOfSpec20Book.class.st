Class {
	#name : #BaselineOfCodeOfSpec20Book,
	#superclass : #BaselineOf,
	#category : #BaselineOfCodeOfSpec20Book
}

{ #category : #baselines }
BaselineOfCodeOfSpec20Book >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'CodeOfSpec20Book';
				package: 'CodeOfSpec20Book2';
				package: 'CodeOfSpec20BookAthens';
				package: 'CodeOfSpec20BookFilm';
				package: 'CodeOfSpec20BookTodo']
]
