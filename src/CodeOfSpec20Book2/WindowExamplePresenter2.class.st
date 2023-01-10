Class {
	#name : #WindowExamplePresenter2,
	#superclass : #WindowExamplePresenter,
	#category : #'CodeOfSpec20Book2-Windowing'
}

{ #category : #examples }
WindowExamplePresenter2 class >> example6 [
	<example>
	| we diag |
	we := WindowExamplePresenter2 new. 
	diag := we openDialogWithSpec
		okAction: [Transcript show: 'okAction'];
		cancelAction: [Transcript show: 'cancelAction'];
		whenClosedDo: [ Transcript show: 'whenClosedDo']


]

{ #category : #initialization }
WindowExamplePresenter2 >> initializePresenters [
   button1 := self newButton.
   button2 := self newButton.
   button1 label: '+'.
   button2 label: '-'.
	self window okToChange

]

{ #category : #initialization }
WindowExamplePresenter2 >> initializeWindow: aWindowPresenter [
  
	aWindowPresenter askOkToClose: true
]

{ #category : #initialization }
WindowExamplePresenter2 >> okToChange [

	^ false
]
