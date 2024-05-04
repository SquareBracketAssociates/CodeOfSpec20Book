"
```
| we |
we := WindowExamplePresenter new.
we open.
we openWithSpec: #defaultSpec.
we openWithSpecLayout: we defaultSpec
```

```
| wewin |
wewin := WindowExamplePresenter new open.
wewin window beUnresizeable
```
"
Class {
	#name : 'WindowExamplePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'button1',
		'button2'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
WindowExamplePresenter class >> defaultLayout [
   ^ SpBoxLayout newLeftToRight
         add: #button1; add: #button2; yourself
]

{ #category : 'specs' }
WindowExamplePresenter class >> example1 [
	<example>
	| we |
	we := WindowExamplePresenter new.
	we openWithSpec.

]

{ #category : 'specs' }
WindowExamplePresenter class >> example2 [

	<example>
	| we |
	we := WindowExamplePresenter new.
	we openWithLayout: #defaultSpec
]

{ #category : 'specs' }
WindowExamplePresenter class >> example3 [
	<example>
	| we |
	we := WindowExamplePresenter new.
	we openWithSpecLayout: we defaultSpec


]

{ #category : 'specs' }
WindowExamplePresenter class >> example4ClosingWorkingExpressedAtOpenDialogLevel [
	<example>
	| we diag |
	we := WindowExamplePresenter new. 
	diag := we openDialogWithSpec
		okAction: [Transcript show: 'okAction'];
		cancelAction: [Transcript show: 'cancelAction'];
		whenClosedDo: [ Transcript show: 'whenClosedDo']


]

{ #category : 'specs' }
WindowExamplePresenter class >> example5 [

	<example>
	| we diag |
	we := WindowExamplePresenter new.
	diag := we openDialog
		        okAction: [ Transcript show: 'okAction' ];
		        cancelAction: [ Transcript show: 'cancelAction' ];
		        whenClosedDo: [ Transcript show: 'whenClosedDo' ]
]

{ #category : 'specs' }
WindowExamplePresenter class >> example6WhenClosed [

	| we |
	we := WindowExamplePresenter new. 
	we openWithSpec
		okAction: [Transcript show: 'okAction'];
		cancelAction: [Transcript show: 'cancelAction'].
 
]

{ #category : 'initialization' }
WindowExamplePresenter >> initializePresenters [
   button1 := self newButton.
   button2 := self newButton.
   button1 label: '+'.
   button2 label: '-'
]
