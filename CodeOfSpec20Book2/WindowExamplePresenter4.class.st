"
Pay attention nothing is working in this presenter

```
| we |
we := WindowExamplePresenter4 new.
we extent: 100@80.
we openWithSpec
```
"
Class {
	#name : #WindowExamplePresenter4,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #'CodeOfSpec20Book2-Windowing'
}

{ #category : #specs }
WindowExamplePresenter4 class >> defaultSpec [
   ^ SpBoxLayout newLeftToRight
         add: #button1; add: #button2; yourself
]

{ #category : #initialization }
WindowExamplePresenter4 >> initializePresenters [

  button1 := self newButton.
  button2 := self newButton.
  button1 label: '+'.
  button2 label: '-'.
  button1 action: [ self window extent: 500@200].
  button2 action: [ self window extent: 200@100]
]
