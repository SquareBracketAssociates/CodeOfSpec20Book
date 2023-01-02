"
A simple widget to display a list of classes


```
WidgetClassListPresenter new open
```
"
Class {
	#name : #WidgetClassListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'list'
	],
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #specs }
WidgetClassListPresenter class >> example [
	<script>
	self new open
]

{ #category : #initialization }
WidgetClassListPresenter >> defaultLayout [
	^ SpBoxLayout newLeftToRight 
		add: #list;
		yourself
]

{ #category : #initialization }
WidgetClassListPresenter >> initializePresenters [
	list := self newList.
	list items: (SpAbstractWidgetPresenter allSubclasses
		 							 sorted: [:a :b | a name < b name ]).
	self focusOrder add: list.
]

{ #category : #initialization }
WidgetClassListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Widgets'
]

{ #category : #actions }
WidgetClassListPresenter >> whenSelectedItemChanged: aBlock [
	list whenSelectedItemChanged: aBlock
]
