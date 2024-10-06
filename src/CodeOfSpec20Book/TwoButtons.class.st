"
I use a horizontal box layout with expanded buttons.
"
Class {
	#name : 'TwoButtons',
	#superclass : 'SpPresenter',
	#instVars : [
		'button1',
		'button2'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
TwoButtons >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #button1;
		add: #button2;
		yourself
]

{ #category : 'initialization' }
TwoButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
