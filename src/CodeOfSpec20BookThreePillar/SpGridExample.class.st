Class {
	#name : #SpGridExample,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'passwordText',
		'acceptButton',
		'cancelButton'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #'instance creation' }
SpGridExample class >> open [ 
	<script>
	self new open
]

{ #category : #layout }
SpGridExample >> defaultLayout [
	"see https://github.com/pharo-spec/Spec/issues/1354"
	
	^ SpGridLayout new
  add: 'Name:' at: 1@1;
  add: #nameText  at: 2@1;
  add: 'Password:' at: 1@2;
  add: #passwordText at: 2@2;  
  add: #acceptButton at: 1@3;
  add: #cancelButton at: 2@3 span: 2@3;
  add: 'test label' at: 1@6;
  yourself
]

{ #category : #initialization }
SpGridExample >> initializePresenters [
	nameText := self newTextInput.   
	passwordText := self newTextInput.
	acceptButton := self newButton.
	acceptButton label: 'Accept'.
	cancelButton := self newButton.
	cancelButton label: 'Cancel'.
  
]
