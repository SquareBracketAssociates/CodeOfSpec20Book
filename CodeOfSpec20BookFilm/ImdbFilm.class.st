Class {
	#name : #ImdbFilm,
	#superclass : #Object,
	#instVars : [
		'name',
		'year',
		'director'
	],
	#classInstVars : [
		'films'
	],
	#category : #CodeOfSpec20BookFilm
}

{ #category : #accessing }
ImdbFilm class >> addFilm: aFilm [
	films add: aFilm

]

{ #category : #accessing }
ImdbFilm class >> films [
       ^ films ifNil: [ films := OrderedCollection new ]

]

{ #category : #accessing }
ImdbFilm >> director [

	^ director
]

{ #category : #accessing }
ImdbFilm >> director: anObject [

	director := anObject
]

{ #category : #accessing }
ImdbFilm >> name [

	^ name
]

{ #category : #accessing }
ImdbFilm >> name: anObject [

	name := anObject
]

{ #category : #accessing }
ImdbFilm >> year [

	^ year
]

{ #category : #accessing }
ImdbFilm >> year: anObject [

	year := anObject
]
