"
self new open
"
Class {
	#name : #SpThreeButtons,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2',
		'button3',
		'nameText',
		'passwordText',
		'acceptButton',
		'cancelButton'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
SpThreeButtons >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom
    	spacing: 15;
    	add: button1 expand: false fill: true padding: 5;
   		add: button2 withConstraints: [ :constraints | constraints
    width: 30; padding: 5];
    addLast: button3 expand: false fill: true padding: 5;
yourself
]

{ #category : #initialization }
SpThreeButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.
	button3 := self newButton.

	button1 label: '1'.
	button2 label: '2'.
	button3 label: '3'
]
