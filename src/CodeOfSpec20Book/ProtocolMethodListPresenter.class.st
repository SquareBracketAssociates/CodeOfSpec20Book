"
`ProtocolMethodListPresenter new open`
"
Class {
	#name : #ProtocolMethodListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'label',
		'methods'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #examples }
ProtocolMethodListPresenter class >> example [
	<script>
	self new open
]

{ #category : #initialization }
ProtocolMethodListPresenter >> defaultLayout [
	^ SpBoxLayout newTopToBottom
			add: #label  withConstraints: [:c | c expand: false];
			add: #methods withConstraints: [:c | c fill: true];
			yourself
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializePresenters [
	methods := self newList.
	methods display: [ :m | m selector ].
	label :=  self newLabel.
	label label: 'Protocol'.
	self focusOrder add: methods
]

{ #category : #initialization }
ProtocolMethodListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Protocol widget'
]

{ #category : #actions }
ProtocolMethodListPresenter >> items: aCollection [
	methods items: aCollection
]

{ #category : #accessing }
ProtocolMethodListPresenter >> label: aText [
	label label: aText
]

{ #category : #accessing }
ProtocolMethodListPresenter >> methods [

	^ methods
]

{ #category : #actions }
ProtocolMethodListPresenter >> resetSelection [
	methods selection unselectAll
]

{ #category : #actions }
ProtocolMethodListPresenter >> whenSelectionChangedDo: aBlock [
	methods whenSelectionChangedDo: aBlock
]
