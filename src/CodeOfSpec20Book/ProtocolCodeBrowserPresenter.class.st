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
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> connectPresenters [

	viewer whenSelectionInClassChanged: [ :selection | text behavior: selection selectedItem ].
	viewer whenSelectionInAPIChanged: [ :selection |
		selection selectedItem
			ifNotNil: [ :item | text text: item sourceCode ] ].
	viewer whenSelectionInEventChanged: [ :selection |
		selection selectedItem
			ifNotNil: [ :item | text text: item sourceCode ] ]
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
			add: (SpBoxLayout newHorizontal add: #viewer ; yourself);
			add: #text;
			yourself
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> initializePresenters [
	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter with: ProtocolViewerPresenter horizontalLayout.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> initializePresenters2 [
	text := self instantiate: SpCodePresenter.
	viewer := self instantiate: ProtocolViewerPresenter.
	text syntaxHighlight: true.
	self focusOrder
		add: viewer;
		add: text
]

{ #category : 'initialization' }
ProtocolCodeBrowserPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Spec Protocol Browser'
]
