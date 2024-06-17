"
I combine a vertical two-button presenter with a list presenter in a vertical layout.
"
Class {
	#name : 'ButtonAndListV2',
	#superclass : 'ButtonAndListH',
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
ButtonAndListV2 >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: buttons layout: #buttonColumn;
		add: list;
		yourself
]

{ #category : 'initialization' }
ButtonAndListV2 >> initializePresenters [

	super initializePresenters.
	buttons beColumn
]
