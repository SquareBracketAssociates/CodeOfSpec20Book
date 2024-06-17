"
A support adding buttons with random numbers as label, and I support removing the last button.
"
Class {
	#name : 'DynamicButtons',
	#superclass : 'SpPresenter',
	#instVars : [
		'addButton',
		'removeButton',
		'text'
	],
	#category : 'CodeOfSpec20Book-Chapter11',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter11'
}

{ #category : 'private' }
DynamicButtons >> addToLayout [

	| randomButtonName newButton |
	removeButton enable.
	randomButtonName := 'Random number: ', (Random new nextInteger: 1000) asString.
	newButton := self newButton
		label: randomButtonName;
		icon: (self iconNamed: #smallObjects);
		yourself.
	self layout add: newButton expand: false
]

{ #category : 'private' }
DynamicButtons >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: addButton expand: false;
		add: removeButton expand: false;
		add: text;
		yourself
]

{ #category : 'initialization' }
DynamicButtons >> initializePresenters [

	addButton := self newButton.
	addButton
		action: [ self addToLayout ];
		label: 'Add a presenter to the layout';
		icon: (self iconNamed: #smallAdd).

	removeButton := self newButton.
	removeButton
		action: [ self removeFromLayout ];
		label: 'Remove a presenter from the layout';
		icon: (self iconNamed: #smallDelete);
		disable.

	text := self newText.
	text
		text: 'I am a text presenter.
		I will not be removed';
		beNotEditable
]

{ #category : 'private' }
DynamicButtons >> removeFromLayout [

	self layout remove: self layout presenters last.
	self layout presenters last = text ifTrue: [ removeButton disable ]
]
