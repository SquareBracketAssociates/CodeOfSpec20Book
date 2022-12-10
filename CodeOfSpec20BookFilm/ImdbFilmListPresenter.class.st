"
I'm a little film list presenter.

```
| app |
app := ImdbApp new. 
(app newPresenter: ImdbFilmListPresenter) open.
```
"
Class {
	#name : #ImdbFilmListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'filmList'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #adding }
ImdbFilmListPresenter >> addFilm [
        | dialog windowPresenter |
        dialog := ImdbFilmPresenter newApplication: self application.
        windowPresenter := dialog openModal.
	windowPresenter isOk
        ifFalse: [ ^ self ].
       ImdbFilm
        addFilm:
         (ImdbFilm new
          name: dialog name;
          director: dialog director;
          year: dialog yearNumber).
       self updatePresenter

	
]

{ #category : #layout }
ImdbFilmListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: filmList;
		  yourself
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializePresenters [

	filmList := self newTable
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Director' evaluated: #director);
		addColumn: (SpStringTableColumn title: 'Year' evaluated: #year);
		yourself.
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Mini IMDB';
		initialExtent: 600@400;
		toolbar: (self newToolbar
					add: (self newToolbarButton 
							label: 'Add film' ;
							icon: (self iconNamed: #smallAdd);
							action: [ self addFilm ];
							yourself);
						yourself)
]

{ #category : #initialization }
ImdbFilmListPresenter >> updatePresenter [
	
	filmList items: ImdbFilm films
]
