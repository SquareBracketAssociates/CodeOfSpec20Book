Class {
	#name : #ProtocolMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'label',
		'methods'
	],
	#category : #CodeOfSpec20Book
}

{ #category : #specs }
ProtocolMethodListPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
			add: #label  withConstraints: [:c | c expand: false];
			add: #methods withConstraints: [:c | c fill: true];
			yourself
]

{ #category : #examples }
ProtocolMethodListPresenter class >> example [ 
	self new openWithSpec
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializePresenter [
	methods := self newList.
	methods displayBlock: [ :m | m selector ].
	label :=  self newLabel.
	label label: 'Protocol'.
	self focusOrder add: methods.
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializeWidgets [
	
	
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Protocol widget'
]
