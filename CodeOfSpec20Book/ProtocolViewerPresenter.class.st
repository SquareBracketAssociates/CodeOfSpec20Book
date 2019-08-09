Class {
	#name : #ProtocolViewerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : #CodeOfSpec20Book
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
	^ SpBoxLayout newHorizontal
			add: #models; add: #api; add: #events;
			yourself
]

{ #category : #specs }
ProtocolViewerPresenter class >> verticalSpec [
	^ SpBoxLayout newVertical
			add: #models; add: #api; add: #events;
			yourself
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializePresenter [
	self presenterCreation.
	self presenterConnectionLogic 
]

{ #category : #initialization }
ProtocolViewerPresenter >> initializeWidgets [
	
	self
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

{ #category : #initialization }
ProtocolViewerPresenter >> presenterConnectionLogic [

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
ProtocolViewerPresenter >> presenterCreation [
	models := self instantiate: WidgetClassListPresenter.
	api := self instantiate: ProtocolMethodListPresenter.
	events := self instantiate: ProtocolMethodListPresenter.

	api label: 'api'.
	events label: 'api-events'.

	self focusOrder add: models; add: api; add: events.
]
