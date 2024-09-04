"
I display a message to indicate that no email has been selected.
"
Class {
	#name : 'NoEmailPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'message'
	],
	#category : 'CodeOfSpec20Book-Chapter12',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter12'
}

{ #category : 'layout' }
NoEmailPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		hAlignCenter;
		vAlignCenter;
		add: message;
		yourself
]

{ #category : 'initialization' }
NoEmailPresenter >> initializePresenters [

	message := self newLabel
		label: 'Select an email from the list to read it.';
		yourself
]
