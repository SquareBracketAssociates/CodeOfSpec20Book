"
Should be revisited
"
Class {
	#name : #ProtocolCodeBrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text',
		'viewer'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
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
ProtocolCodeBrowserPresenter >> connectPresenters [

	viewer whenClassChanged: [ :class | text behavior: class ].
	viewer whenAPIChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ].
	viewer whenEventChanged: [ :item |
		item
			ifNotNil: [ text text: item sourceCode ] ]
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializePresenters [
	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : #initialization }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Spec Protocol Browser'
]
