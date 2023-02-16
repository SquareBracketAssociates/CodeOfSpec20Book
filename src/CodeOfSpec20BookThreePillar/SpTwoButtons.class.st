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
		'button2',
		'button3'
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
		add: #button1 expand: false ; add: #button2 expand: false ;
		yourself

]

{ #category : #'as yet unclassified' }
SpTwoButtons class >> open [  
	<script>
	
	self new open
]

{ #category : #initialization }
SpTwoButtons >> beCol [

	self layout: self class buttonCol
]

{ #category : #initialization }
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
	button3 := self newButton.

	button1 label: '1'.
	button2 label: '2'.
	button3 label: '3'
]
