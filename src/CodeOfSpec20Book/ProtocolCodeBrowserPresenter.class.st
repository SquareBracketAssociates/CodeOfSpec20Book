"
A specialized code browser reusing different presenters

```
ProtocolCodeBrowserPresenter new open
```
"
Class {
	#name : 'ProtocolCodeBrowserPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'text',
		'viewer'
	],
	#category : 'CodeOfSpec20Book-Chapter07',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter07'
}

{ #category : 'examples' }
ProtocolCodeBrowserPresenter class >> example [

	self new open
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> connectPresenters [

	viewer whenSelectionInClassChanged: [ :selection |
		text behavior: selection selectedItem ].
	viewer whenSelectionInAPIChanged: [ :selection |
		selection selectedItem
			ifNotNil: [ :item | text beForMethod: item; text: item sourceCode ] ].
	viewer whenSelectionInEventChanged: [ :selection |
		selection selectedItem
			ifNotNil: [ :item | text beForMethod: item; text: item sourceCode ] ]
]

{ #category : 'layout' }
ProtocolCodeBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight add: #viewer; yourself);
		add: #text;
		yourself
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> initializePresenters [

	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	viewer layout: viewer horizontalLayout.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Spec Protocol Browser'
]
