Class {
	#name : 'ImdbFilm',
	#superclass : 'Object',
	#instVars : [
		'name',
		'year',
		'director'
	],
	#classInstVars : [
		'films'
	],
	#category : 'CodeOfSpec20Book-Chapter03',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter03'
}

{ #category : 'initialization' }
ImdbFilm class >> ET [

	^ self new 
		name: 'E.T.';
		director: 'Steven Spielberg';
		year: '1982'; 
		yourself
]

{ #category : 'initialization' }
ImdbFilm class >> addET [

	films add: self ET
]

{ #category : 'accessing' }
ImdbFilm class >> addFilm: aFilm [

	films add: aFilm
]

{ #category : 'accessing' }
ImdbFilm class >> films [

	^ films ifNil: [ films := OrderedCollection new ]
]

{ #category : 'initialization' }
ImdbFilm class >> reset [

	films := OrderedCollection new
]

{ #category : 'accessing' }
ImdbFilm >> director [

	^ director
]

{ #category : 'accessing' }
ImdbFilm >> director: aString [

	director := aString
]

{ #category : 'accessing' }
ImdbFilm >> name [

	^ name
]

{ #category : 'accessing' }
ImdbFilm >> name: aString [

	name := aString
]

{ #category : 'accessing' }
ImdbFilm >> year [

	^ year
]

{ #category : 'accessing' }
ImdbFilm >> year: aString [

	year := aString
]
