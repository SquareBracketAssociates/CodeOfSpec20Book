"
```
SpTwoButtons new openWithLayout: SpTwoButtons buttonRow
```
"
Class {
	#name : #SpTwoButtons,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2'
	],
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #'as yet unclassified' }
SpTwoButtons class >> buttonCol [
	^SpBoxLayout newTopToBottom
		add: #button1; add: #button2;
		yourself
]

{ #category : #'as yet unclassified' }
SpTwoButtons class >> buttonRow [
	
	^ SpBoxLayout newLeftToRight
		add: #button1; add: #button2;
		yourself

]

{ #category : #'as yet unclassified' }
SpTwoButtons >> beCol [

	self layout: self class buttonCol
]

{ #category : #'as yet unclassified' }
SpTwoButtons >> beRow [

	self layout: self class buttonRow
]

{ #category : #initialization }
SpTwoButtons >> defaultLayout [ 

	^ self class buttonRow 
]

{ #category : #initialization }
SpTwoButtons >> initializePresenters [

	button1 := self newButton.
	button2 := self newButton.

	button1 label: '1'.
	button2 label: '2'
]
