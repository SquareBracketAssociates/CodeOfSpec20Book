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
	#category : 'CodeOfSpec20Book-Chapter11',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter11'
}

{ #category : 'layout' }
TwoButtons >> defaultLayout [

	^ self class buttonRow
]

{ #category : 'initialization' }
TwoButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
