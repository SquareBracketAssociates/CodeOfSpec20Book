Class {
	#name : #ImdbFilm,
	#superclass : #Object,
	#instVars : [
		'name',
		'year',
		'director'
	],
	#category : #CodeOfSpec20BookFilm
}

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
