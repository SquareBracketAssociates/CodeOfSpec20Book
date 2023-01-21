Class {
	#name : #ImdbConfiguration,
	#superclass : #SpMorphicConfiguration,
	#category : #CodeOfSpec20BookFilm
}

{ #category : #sylesheets }
ImdbConfiguration >> customStyleSheet [

	^ (SpStyleVariableSTONReader fromString: '
.application [ 
	.customLabel [ Draw { #color: #red } ] ] ')
]

{ #category : #sylesheets }
ImdbConfiguration >> newStyleSheet [

	^ SpStyle defaultStyleSheet copy, self customStyleSheet
]
