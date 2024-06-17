"
I use a builder to create a grid layout for a small form.
"
Class {
	#name : 'GridExampleWithBuilder',
	#superclass : 'SpPresenter',
	#instVars : [
		'promptLabel',
		'nameText',
		'suggestionsText',
		'submitButton'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
GridExampleWithBuilder >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		builder
			add: #promptLabel span: 3@1; nextRow;
			add: 'Name:'; add: #nameText span: 2@1; nextRow;
			add: 'Suggestions:'; add: #suggestionsText span: 2@1; nextRow;
			nextColumn; add: #submitButton ]
]

{ #category : 'initialization' }
GridExampleWithBuilder >> initializePresenters [

	promptLabel := self newLabel
		label: 'Please enter your name and your suggestions.';
		yourself.
	nameText := self newTextInput.
	suggestionsText := self newText.
	submitButton := self newButton
		label: 'Submit';
		yourself
]
