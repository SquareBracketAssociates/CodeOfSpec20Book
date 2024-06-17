"
I use a grid layout for a small form.
"
Class {
	#name : 'GridExample',
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
GridExample >> defaultLayout [

	^ SpGridLayout new
		add: #promptLabel at: 1@1 span: 3@1;
		add: 'Name:' at: 1@2;
		add: #nameText at: 2@2 span: 2@1;
		add: 'Suggestions:' at: 1@3;
		add: #suggestionsText at: 2@3 span: 2@1;
		add: #submitButton at: 2@4 span: 1@1;
		yourself
]

{ #category : 'initialization' }
GridExample >> initializePresenters [

	promptLabel := self newLabel
		label: 'Please enter your name and your suggestions.';
		yourself.
	nameText := self newTextInput.
	suggestionsText := self newText.
	submitButton := self newButton
		label: 'Submit';
		yourself
]
