"
I use a horizontal box layout with buttons that are not expanded.
"
Class {
	#name : 'TwoButtons2',
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
TwoButtons2 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: button1 expand: false;
		add: button2 expand: false;
		yourself
]

{ #category : 'initialization' }
TwoButtons2 >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
