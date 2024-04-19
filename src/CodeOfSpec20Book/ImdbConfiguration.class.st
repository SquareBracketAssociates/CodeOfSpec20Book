Class {
	#name : 'ImdbConfiguration',
	#superclass : 'SpMorphicConfiguration',
	#category : 'CodeOfSpec20Book-Chapter03',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter03'
}

{ #category : 'configuring' }
ImdbConfiguration >> configure: anApplication [

	super configure: anApplication.
	self addStyleSheetFromString: self customStyleSheet
]

{ #category : 'sylesheets' }
ImdbConfiguration >> customStyleSheet [

	^ '
.application [
	.customLabel [ Draw { #color: #red } ] ] '
]
