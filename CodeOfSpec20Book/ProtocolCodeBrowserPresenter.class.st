Class {
	#name : #ProtocolCodeBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'viewer'
	],
	#category : #CodeOfSpec20Book
}

{ #category : #specs }
ProtocolCodeBrowserPresenter class >> defaultSpec [
	"self new openWithSpec"
	
	^ SpBoxLayout newVertical 
			add: 
			 (SpBoxLayout newHorizontal  
					add: #viewer;
					add: #models;
					add: (SpBoxLayout newVertical
								add: (SpBoxLayout newHorizontal add: #viewer ; add: #api; yourself);
								add: (SpBoxLayout newHorizontal add: #viewer ; add: #events; yourself);
								yourself);
					add: #text;
					yourself);
				yourself
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializePresenter [
	self presenterCreation.
	self presenterConnection
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializeWidgets [ 
	""
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Spec Protocol Browser'
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> presenterConnection [
	viewer whenClassChanged: [ :class | text behavior: class ].
	viewer whenAPIChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ].
	viewer whenEventChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ]
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> presenterCreation [
	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]
