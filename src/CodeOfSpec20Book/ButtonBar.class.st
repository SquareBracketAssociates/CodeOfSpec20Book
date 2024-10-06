"
I use a horizontal box layout with three buttons. Spacing and padding is applied, and the third button is added to the end of the box.
"
Class {
	#name : 'ButtonBar',
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
ButtonBar >> defaultLayout [

	| left right |
	left := SpBoxLayout newLeftToRight
		spacing: 15;
		add: button1 expand: false;
		add: button2 expand: false;
		yourself.
	right := SpBoxLayout newLeftToRight
		hAlignEnd;
		add: button3 expand: false;
		yourself.
	^ SpBoxLayout newLeftToRight
		add: left;
		add: right;
		yourself
]

{ #category : 'initialization' }
ButtonBar >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button3 := self newButton.
	button1 label: '1'.
	button2 label: '2'.
	button3 label: '3'
]
