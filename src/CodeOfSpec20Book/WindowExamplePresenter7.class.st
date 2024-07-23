"
I set the initial keyboard focus.
"
Class {
	#name : 'WindowExamplePresenter7',
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
WindowExamplePresenter7 class >> exampleOpen [

	self new open

]

{ #category : 'specs' }
WindowExamplePresenter7 class >> exampleOpenAsDialog [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
]

{ #category : 'specs' }
WindowExamplePresenter7 class >> exampleOpenAsDialogWithButtonActions [

	| presenter dialog |
	presenter := self new.
	dialog := presenter openDialog
		okAction: [ 'okAction' crTrace ];
		cancelAction: [ 'cancelAction' crTrace ]
]

{ #category : 'layout' }
WindowExamplePresenter7 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter7 >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter whenOpenedDo: [ aDialogWindowPresenter defaultButton takeKeyboardFocus ]
]

{ #category : 'initialization' }
WindowExamplePresenter7 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'
]

{ #category : 'initialization' }
WindowExamplePresenter7 >> initializeWindow: aWindowPresenter [

	aWindowPresenter whenOpenedDo: [ minusButton takeKeyboardFocus ]
]
