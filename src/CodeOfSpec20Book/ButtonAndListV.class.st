"
I combine a vertical two-button presenter with a list presenter in a horizontal layout.
"
Class {
	#name : 'ButtonAndListV',
	#superclass : 'ButtonAndListH',
	#category : 'CodeOfSpec20Book-Chapter11',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter11'
}

{ #category : 'initialization' }
ButtonAndListV >> initializePresenters [

	super initializePresenters.
	buttons beColumn
]
