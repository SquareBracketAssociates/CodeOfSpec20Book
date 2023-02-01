Class {
	#name : #ImdbConfiguration,
	#superclass : #SpMorphicConfiguration,
	#category : #CodeOfSpec20BookFilm
}

{ #category : #configuring }
ImdbConfiguration >> configure: anApplication [

	super configure: anApplication.
	self addStyleSheetFromString: self customStyleSheet
]

{ #category : #sylesheets }
ImdbConfiguration >> customStyleSheet [

	^ '
.application [
	.customLabel [ Draw { #color: #red } ] ] '
]
