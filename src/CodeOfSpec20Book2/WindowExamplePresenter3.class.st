Class {
	#name : #WindowExamplePresenter3,
	#superclass : #WindowExamplePresenter,
	#category : #'CodeOfSpec20Book2-Windowing'
}

{ #category : #examples }
WindowExamplePresenter3 class >> exampleDialogWhenClosed [
	<example>
	| we diag |
	we := WindowExamplePresenter3 new. 
	diag := we openDialogWithSpec.
	diag
		okAction: [Transcript show: 'okAction'];
		cancelAction: [Transcript show: 'cancelAction'].
	
]

{ #category : #examples }
WindowExamplePresenter3 class >> exampleWhenClosed [
	<example>
	| we |
	we := WindowExamplePresenter3 new. 
	we openWithSpec.
	we window close.
	
]

{ #category : #initialization }
WindowExamplePresenter3 >> initializePresenters [
   button1 := self newButton.
   button2 := self newButton.
   button1 label: '+'.
   button2 label: '-'.


]

{ #category : #initialization }
WindowExamplePresenter3 >> initializeWindow: aWindowPresenter [

	aWindowPresenter whenOpenedDo: [ UIManager default inform: 'When opened' ].
	aWindowPresenter whenClosedDo: [ UIManager default inform: 'When closed' ].
	
]
