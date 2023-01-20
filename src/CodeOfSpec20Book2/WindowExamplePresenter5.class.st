"
```
| wewin |
wewin := WindowExamplePresenter5 new open.
wewin window beUnresizeable
```
"
Class {
	#name : #WindowExamplePresenter5,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'CodeOfSpec20Book2-Windowing'
}

{ #category : #layout }
WindowExamplePresenter5 class >> defaultLayout [

   ^ SpBoxLayout newLeftToRight
         add: #button1; add: #button2; yourself
]

{ #category : #initialization }
WindowExamplePresenter5 >> initializePresenters [

  button1 := self newButton.
  button2 := self newButton.
  button1 label: '+'.
  button2 label: '-'.
 
]

{ #category : #initialization }
WindowExamplePresenter5 >> initializeWindow: aWindowPresenter [

  aWindowPresenter initialExtent: 80@100.
  aWindowPresenter title: 'Click to grow or shrink.'
]
