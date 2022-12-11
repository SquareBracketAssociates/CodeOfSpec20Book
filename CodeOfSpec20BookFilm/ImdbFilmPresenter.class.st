"
I simple widget to display basic information about films.

```
| app |
app := ImdbApp new.
(app newPresenter: ImdbFilmPresenter) open.
```
"
Class {
	#name : #ImdbFilmPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'directorText',
		'yearNumber',
		'nameLabel'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #layout }
ImdbFilmPresenter >> defaultLayout [
	
	^ SpGridLayout build: [ :builder |
		builder
			beColumnNotHomogeneous;
			column:2 withConstraints: #beExpand;
			add: nameLabel; add: nameText; nextRow;
			add: 'Director'; add: directorText; nextRow;
			add: 'Year'; add: yearNumber ]
]

{ #category : #accessing }
ImdbFilmPresenter >> director [
       ^ directorText text
]

{ #category : #accessing }
ImdbFilmPresenter >> directorText [

	^ directorText
]

{ #category : #accessing }
ImdbFilmPresenter >> directorText: anObject [

	directorText := anObject
]

{ #category : #window }
ImdbFilmPresenter >> initializeDialogWindow: aDialogPresenter [

	aDialogPresenter centered.
	aDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save Film' do: [ :presenter | presenter beOk; close ].
]

{ #category : #initialization }
ImdbFilmPresenter >> initializePresenters [ 
	nameLabel := self newLabel 
		label: 'Name'; 
		addStyle: 'customLabel'; 
		yourself.
	nameText := self newTextInput.
	directorText := self newTextInput.
	yearNumber := self newNumberInput 
			rangeMinimum: 1900 maximum: Year current year;
			yourself.
]

{ #category : #window }
ImdbFilmPresenter >> initializeWindow: aWindowPresenter [
        aWindowPresenter
         title: 'Film';
         initialExtent: 400 @ 250
]

{ #category : #accessing }
ImdbFilmPresenter >> name [
       ^ nameText text
]

{ #category : #accessing }
ImdbFilmPresenter >> nameText [

	^ nameText
]

{ #category : #accessing }
ImdbFilmPresenter >> nameText: anObject [

	nameText := anObject
]

{ #category : #model }
ImdbFilmPresenter >> setModel: aFilm [
        nameText text: aFilm name.
        directorText text: aFilm director.
        yearNumber number: aFilm year.
]

{ #category : #accessing }
ImdbFilmPresenter >> yearNumber [
       ^ yearNumber text
]

{ #category : #accessing }
ImdbFilmPresenter >> yearNumber: anObject [

	yearNumber := anObject
]
