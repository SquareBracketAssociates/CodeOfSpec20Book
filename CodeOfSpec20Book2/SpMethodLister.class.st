"
(SpMethodLister on: Point) openWithSpec
"
Class {
	#name : #SpMethodLister,
	#superclass : #SpPresenter,
	#instVars : [
		'aClass',
		'list'
	],
	#category : #CodeOfSpec20Book2
}

{ #category : #specs }
SpMethodLister class >> defaultSpec [ 
	^ SpBoxLayout newTopToBottom add: #list ; yourself
]

{ #category : #initialization }
SpMethodLister >> class: aModel [

	aClass := aModel
	
]

{ #category : #initialization }
SpMethodLister >> initializePresenters [ 
	list := self newList.
	list items: aClass selectors sorted
]

{ #category : #'accessing - model' }
SpMethodLister >> setModelBeforeInitialization: aModel [

	aClass := aModel
	
]
