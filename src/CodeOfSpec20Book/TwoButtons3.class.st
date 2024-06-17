"
I use a vertical box layout with three buttons. Spacing and padding is applied, and the third button is added to the end of the box.
"
Class {
	#name : 'TwoButtons3',
	#superclass : 'SpPresenter',
	#instVars : [
		'button1',
		'button2',
		'button3'
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
		addLast: button3 expand: false fill: true padding: 5;
		yourself
]

{ #category : 'initialization' }
TwoButtons3 >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button3 := self newButton.
	button1 label: '1'.
	button2 label: '2'.
	button3 label: '3'
]
