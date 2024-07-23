"
I switch the keyboard focus order of the plus and minus buttons.
"
Class {
	#name : 'WindowExamplePresenter6',
	#superclass : 'SpPresenter',
	#instVars : [
		'minusButton',
		'plusButton'
	],
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'specs' }
WindowExamplePresenter6 class >> exampleOpen [

	self new open

]

{ #category : 'specs' }
WindowExamplePresenter6 class >> exampleOpenAsDialog [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
]

{ #category : 'specs' }
WindowExamplePresenter6 class >> exampleOpenAsDialogWithButtonActions [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
		okAction: [ 'okAction' crTrace ];
		cancelAction: [ 'cancelAction' crTrace ]
]

{ #category : 'layout' }
WindowExamplePresenter6 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter6 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'.
	self focusOrder
		add: minusButton;
		add: plusButton
]
