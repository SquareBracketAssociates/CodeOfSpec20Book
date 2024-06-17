"
I combine a vertical two-button presenter with a list presenter in a horizontal layout.
"
Class {
	#name : 'ButtonAndListV',
	#superclass : 'ButtonAndListH',
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'initialization' }
ButtonAndListV >> initializePresenters [

	super initializePresenters.
	buttons beColumn
]
