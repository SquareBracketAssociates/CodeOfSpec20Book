"
I'm a little film list presenter.

```
| app |
app := ImdbApp new. 
(app newPresenter: ImdbFilmListPresenter) open.
```

```
| app presenter |
app := ImdbApp new. 
presenter := app newPresenter: ImdbFilmListPresenter.
presenter openWithLayout: presenter listAboveLayout.
```
"
Class {
	#name : 'ImdbFilmListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'filmList',
		'detail'
	],
	#category : 'CodeOfSpec20Book-Chapter03',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter03'
}

{ #category : 'examples' }
ImdbFilmListPresenter class >> example [

	| app presenter |
	app := ImdbApp new. 
	presenter := app newPresenter: self.
	presenter open
]

{ #category : 'examples' }
ImdbFilmListPresenter class >> exampleWithListBelow [
	
	| app presenter |
	app := ImdbApp new. 
	presenter := app newPresenter: self.
	presenter openWithLayout: presenter listBelowLayout
]

{ #category : 'adding' }
ImdbFilmListPresenter >> addFilm [

	| dialog windowPresenter film |
	dialog := ImdbFilmPresenter newApplication: self application.
	windowPresenter := dialog openModal.
	windowPresenter isOk ifFalse: [ ^ self ].

	film := ImdbFilm new
		name: dialog name;
		director: dialog director;
		year: dialog yearNumber.
	ImdbFilm addFilm: film.
	self updatePresenter
]

{ #category : 'test support' }
ImdbFilmListPresenter >> clickFilmAtIndex: anIndex [

	filmList clickAtIndex: anIndex
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> connectPresenters [

	filmList whenSelectionChangedDo: [ :selectedItemMode |
		detail setModel: selectedItemMode selectedItem ]
]

{ #category : 'layout' }
ImdbFilmListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: filmList;
		  add: detail;
		  yourself
]

{ #category : 'test support' }
ImdbFilmListPresenter >> detail [

	^ detail
]

{ #category : 'test support' }
ImdbFilmListPresenter >> filmList [

	^ filmList
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> initializePresenters [

	filmList := self newTable
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Director' evaluated: #director);
		addColumn: (SpStringTableColumn title: 'Year' evaluated: #year);
		yourself.
	detail := self instantiate: ImdbFilmPresenter.
	detail editable: false
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [

	| addButton toolbar |
	addButton := self newToolbarButton
			label: 'Add film' ;
			icon: (self iconNamed: #smallAdd);
			action: [ self addFilm ];
			yourself.
	toolbar := self newToolbar
		add: addButton;
		yourself.
	aWindowPresenter
		title: 'Mini IMDB';
		initialExtent: 600@400;
		toolbar: toolbar
]

{ #category : 'layout' }
ImdbFilmListPresenter >> listBelowLayout [

	^ SpBoxLayout newTopToBottom
		add: detail;
		add: filmList; 
		yourself
]

{ #category : 'layout' }
ImdbFilmListPresenter >> listOnlyLayout [ 

	^ SpBoxLayout newTopToBottom
		add: filmList; 
		yourself
]

{ #category : 'initialization' }
ImdbFilmListPresenter >> updatePresenter [
	
	filmList items: ImdbFilm films
]
