"
I ask confirmation before closing the window.

Due to a [bug in Spec](https://github.com/pharo-spec/Spec/issues/1547), the `whenWillCloseDo:` block is triggered twice.
"
Class {
	#name : 'WindowExamplePresenter2',
	#superclass : 'SpPresenter',
	#instVars : [
		'minusButton',
		'plusButton'
	],
	#category : 'CodeOfSpec20Book-Chapter09',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter09'
}

{ #category : 'examples' }
WindowExamplePresenter2 class >> exampleCloseWindowAfterConfirmation [

	self new open

]

{ #category : 'layout' }
WindowExamplePresenter2 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: #plusButton;
		add: #minusButton;
		yourself
]

{ #category : 'initialization' }
WindowExamplePresenter2 >> initializePresenters [

	plusButton := self newButton.
	minusButton := self newButton.
	plusButton label: '+'.
	minusButton label: '-'
]

{ #category : 'initialization' }
WindowExamplePresenter2 >> initializeWindow: aWindowPresenter [

	aWindowPresenter whenWillCloseDo: [ :announcement |
		(self confirm: 'Are you sure that you want to close the window?')
			ifFalse: [ announcement denyClose ] ]
]
