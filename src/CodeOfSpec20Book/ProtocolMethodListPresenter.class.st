"
`ProtocolMethodListPresenter new open`
"
Class {
	#name : 'ProtocolMethodListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'label',
		'methods'
	],
	#category : 'CodeOfSpec20Book-Chapter07',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter07'
}

{ #category : 'examples' }
ProtocolMethodListPresenter class >> example [

	self new open
]

{ #category : 'layout' }
ProtocolMethodListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #label expand: false;
		add: #methods;
		yourself
]

{ #category : 'initialization' }
ProtocolMethodListPresenter >> initializePresenters [

	methods := self newList.
	methods display: [ :m | m selector ].
	label := self newLabel.
	label label: 'Protocol'.
	self focusOrder add: methods
]

{ #category : 'initialization' }
ProtocolMethodListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Protocol widget'
]

{ #category : 'api' }
ProtocolMethodListPresenter >> items: aCollection [

	methods items: aCollection
]

{ #category : 'api' }
ProtocolMethodListPresenter >> label: aText [

	label label: aText
]

{ #category : 'accessing' }
ProtocolMethodListPresenter >> methods [

	^ methods
]

{ #category : 'api' }
ProtocolMethodListPresenter >> resetSelection [

	methods selection unselectAll
]

{ #category : 'api' }
ProtocolMethodListPresenter >> whenSelectionChangedDo: aBlock [

	methods whenSelectionChangedDo: aBlock
]
