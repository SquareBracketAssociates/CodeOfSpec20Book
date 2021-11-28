"
should be revisited
"
Class {
	#name : #ProtocolViewerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #specs }
ProtocolViewerPresenter class >> defaultSpec [
	^ self verticalSpec
]

{ #category : #specs }
ProtocolViewerPresenter class >> example [

	self new openWithSpec
]

{ #category : #specs }
ProtocolViewerPresenter class >> exampleHorizontal [
	
	self new openWithSpec: #horizontalSpec
]

{ #category : #specs }
ProtocolViewerPresenter class >> horizontalSpec [
	^ SpBoxLayout newLeftToRight 
			add: #models; add: #api; add: #events;
			yourself
]

{ #category : #specs }
ProtocolViewerPresenter class >> verticalSpec [
	^ SpBoxLayout newTopToBottom 
			add: #models; add: #api; add: #events;
			yourself
]

{ #category : #initialization }
ProtocolViewerPresenter >> connectPresenters [

	models whenSelectedItemChanged: [ :class |
		api resetSelection.
		events resetSelection.
		class
			ifNil: [ api items: #(). events items: #() ]
			ifNotNil: [
				api items: (self methodsIn: class for: 'api').
				events items: (self methodsIn: class for: 'api-events') ] ].

	api whenSelectedItemChanged: [ :method |
 		method ifNotNil: [ events resetSelection ] ].
	events whenSelectedItemChanged: [ :method |
		method ifNotNil: [ api resetSelection ] ].
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializePresenters [
	models := self instantiate: WidgetClassListPresenter.
	api := self instantiate: ProtocolMethodListPresenter.
	events := self instantiate: ProtocolMethodListPresenter.

	api label: 'api'.
	events label: 'api-events'.

	self focusOrder add: models; add: api; add: events.
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Protocol viewer'
]

{ #category : #helpers }
ProtocolViewerPresenter >> methodsIn: class for: protocol [
	^ (class methodsInProtocol: protocol) sorted:
	  		 [ :a :b | a selector < b selector ].
]

{ #category : #action }
ProtocolViewerPresenter >> whenAPIChanged: aBlock [
	api whenSelectedItemChanged: aBlock
]

{ #category : #action }
ProtocolViewerPresenter >> whenClassChanged: aBlock [
	models whenSelectedItemChanged: aBlock
]

{ #category : #action }
ProtocolViewerPresenter >> whenEventChanged: aBlock [
	events whenSelectedItemChanged: aBlock
]
