"
`ProtocolViewerPresenter new open` at least!
"
Class {
	#name : 'ProtocolViewerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : 'CodeOfSpec20Book-Chapter07',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter07'
}

{ #category : 'examples' }
ProtocolViewerPresenter class >> example [

	self new open
]

{ #category : 'examples' }
ProtocolViewerPresenter class >> exampleHorizontal [

	| instance |
    instance := self new.
    instance openWithLayout: instance horizontalLayout
]

{ #category : 'initialization' }
ProtocolViewerPresenter >> connectPresenters [

	models whenSelectionChangedDo: [ :selection |
		| class |
		api resetSelection.
		events resetSelection.
		class := selection selectedItem.
		class
			ifNil: [
				api items: #().
				events items: #() ]
			ifNotNil: [
				api items: (self methodsIn: class for: 'api').
				events items: (self methodsIn: class for: 'api - events') ] ].

	api whenSelectionChangedDo: [ :selection |
 		selection selectedItem ifNotNil: [ events resetSelection ] ].
	events whenSelectionChangedDo: [ :selection |
		selection selectedItem ifNotNil: [ api resetSelection ] ]
]

{ #category : 'layout' }
ProtocolViewerPresenter >> defaultLayout [

	^ self verticalLayout
]

{ #category : 'layout' }
ProtocolViewerPresenter >> horizontalLayout [

	^ SpBoxLayout newLeftToRight
		add: #models;
		add: #api;
		add: #events;
		yourself
]

{ #category : 'initialization' }
ProtocolViewerPresenter >> initializePresenters [

	models := self instantiate: WidgetClassListPresenter.
	api := self instantiate: ProtocolMethodListPresenter.
	events := self instantiate: ProtocolMethodListPresenter.

	api label: 'api'.
	events label: 'api-events'.

	self focusOrder
		add: models;
		add: api;
		add: events
]

{ #category : 'initialization' }
ProtocolViewerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Protocol viewer'
]

{ #category : 'private' }
ProtocolViewerPresenter >> methodsIn: class for: protocol [

	^ (class methodsInProtocol: protocol) sorted: [ :a :b | a selector < b selector ]
]

{ #category : 'layout' }
ProtocolViewerPresenter >> verticalLayout [

	^ SpBoxLayout newTopToBottom
		add: #models;
		add: #api;
		add: #events;
		yourself
]

{ #category : 'api' }
ProtocolViewerPresenter >> whenSelectionInAPIChanged: aBlock [

	api whenSelectionChangedDo: aBlock
]

{ #category : 'api' }
ProtocolViewerPresenter >> whenSelectionInClassChanged: aBlock [

	models whenSelectionChangedDo: aBlock
]

{ #category : 'api' }
ProtocolViewerPresenter >> whenSelectionInEventChanged: aBlock [

	events whenSelectionChangedDo: aBlock
]
