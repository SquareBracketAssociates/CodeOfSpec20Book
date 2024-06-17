"
I use a horizontal box layout with expanded buttons.
"
Class {
	#name : 'TwoButtons4',
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
TwoButtons4 class >> buttonColumn [

	^ SpBoxLayout newTopToBottom
		add: #button1;
		add: #button2;
		yourself
]

{ #category : 'layout' }
TwoButtons4 class >> buttonRow [

	^ SpBoxLayout newLeftToRight
		add: #button1;
		add: #button2;
		yourself
]

{ #category : 'as yet unclassified' }
TwoButtons4 >> beColumn [

	self layout: self class buttonColumn
]

{ #category : 'as yet unclassified' }
TwoButtons4 >> beRow [

	self layout: self class buttonRow
]

{ #category : 'layout' }
TwoButtons4 >> defaultLayout [

	^ self class buttonRow
]

{ #category : 'initialization' }
TwoButtons4 >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button1 label: '1'.
	button2 label: '2'
]
