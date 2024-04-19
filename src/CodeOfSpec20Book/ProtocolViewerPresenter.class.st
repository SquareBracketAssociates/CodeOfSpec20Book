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
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'specs' }
ProtocolViewerPresenter class >> defaultLayout [
	^ self verticalLayout
]

{ #category : 'specs' }
ProtocolViewerPresenter class >> example [

	self new open
]

{ #category : 'specs' }
ProtocolViewerPresenter class >> horizontalLayout [
	^ SpBoxLayout newLeftToRight 
			add: #models; 
			add: #api; 
			add: #events;
			yourself
]

{ #category : 'specs' }
ProtocolViewerPresenter class >> verticalLayout [
	^ SpBoxLayout newTopToBottom 
			add: #models; 
			add: #api; 
			add: #events;
			yourself
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
		selection selectedItem ifNotNil: [ api resetSelection ] ].
]

{ #category : 'layouts' }
ProtocolViewerPresenter >> defaultLayout [
	^ self verticalLayout
]

{ #category : 'layouts' }
ProtocolViewerPresenter >> horizontalLayout [
	^ self class horizontalLayout
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

{ #category : 'helpers' }
ProtocolViewerPresenter >> methodsIn: class for: protocol [
	^ (class methodsInProtocol: protocol) sorted: [ :a :b | a selector < b selector ]
]

{ #category : 'layouts' }
ProtocolViewerPresenter >> verticalLayout [
	^ self class verticalLayout 
]

{ #category : 'action' }
ProtocolViewerPresenter >> whenSelectionInAPIChanged: aBlock [
	api whenSelectionChangedDo: aBlock
]

{ #category : 'action' }
ProtocolViewerPresenter >> whenSelectionInClassChanged: aBlock [
	models whenSelectionChangedDo: aBlock
]

{ #category : 'action' }
ProtocolViewerPresenter >> whenSelectionInEventChanged: aBlock [
	events whenSelectionChangedDo: aBlock
]
