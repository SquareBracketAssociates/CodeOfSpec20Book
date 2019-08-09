Class {
	#name : #WidgetClassListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'list'
	],
	#category : #CodeOfSpec20Book
}

{ #category : #specs }
WidgetClassListPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #list;
		yourself
]

{ #category : #specs }
WidgetClassListPresenter class >> example [

	self new openWithSpec
]

{ #category : #initialization }
WidgetClassListPresenter >> initializePresenter [
	list := self newList.
	list items: (SpAbstractWidgetPresenter allSubclasses
		 							 sorted: [:a :b | a name < b name ]).
	self focusOrder add: list.
]

{ #category : #initialization }
WidgetClassListPresenter >> initializeWidgets [
	
]

{ #category : #initialization }
WidgetClassListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Widgets'
]

{ #category : #actions }
WidgetClassListPresenter >> whenSelectedItemChanged: aBlock [
	list whenSelectedItemChanged: aBlock
]
