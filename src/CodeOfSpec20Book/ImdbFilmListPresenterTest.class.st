Class {
	#name : 'ImdbFilmListPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'CodeOfSpec20Book-Chapter03',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter03'
}

{ #category : 'running' }
ImdbFilmListPresenterTest >> setUp [

	super setUp. 
	ImdbFilm reset. 
	ImdbFilm addET
]

{ #category : 'running' }
ImdbFilmListPresenterTest >> tearDown [

	presenter ifNotNil: [ presenter delete ].
	super tearDown
]

{ #category : 'tests' }
ImdbFilmListPresenterTest >> testListIsSimpleSelection [

	presenter := ImdbFilmListPresenter new.	
	presenter open.
	self deny: presenter filmList isMultipleSelection
]

{ #category : 'tests' }
ImdbFilmListPresenterTest >> testNoSelectionClearsDetails [

	| name |
	"Arrange"
	presenter := ImdbFilmListPresenter new.
	presenter open.

	"Act"
	presenter clickFilmAtIndex: 1.

	"Assert"
	name := presenter detail name.
	self deny: name isEmpty.
	self assert: presenter filmList listSize equals: 1.

	presenter clickFilmAtIndex: 2.
	self assert: presenter detail name equals: ''
]

{ #category : 'tests' }
ImdbFilmListPresenterTest >> testWhenSelectingOneFilmThenDetailIsUpdated [

	| detail |
	"Arrange"
	presenter := ImdbFilmListPresenter new.
	presenter open.
	detail := presenter detail.
	self assert: detail name isEmpty.

	"Act"
	presenter clickFilmAtIndex: 1.

	"Assert"
	self deny: detail name isEmpty
]
