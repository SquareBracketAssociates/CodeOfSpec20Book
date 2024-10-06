"
I use a vertical box layout with two buttons, with spacing and padding.
"
Class {
	#name : 'TwoButtons3',
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
TwoButtons3 >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 15;
		add: button1 expand: false fill: true padding: 5;
		add: button2 withConstraints: [ :constraints |
			constraints height: 80; padding: 5 ];
		yourself
]

{ #category : 'initialization' }
TwoButtons3 >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
