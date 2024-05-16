"
A simple widget to display a list of classes


```
WidgetClassListPresenter new open
```
"
Class {
	#name : 'WidgetClassListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'list'
	],
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'examples' }
WidgetClassListPresenter class >> example [

	<script>
	self new open
]

{ #category : 'layout' }
WidgetClassListPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight 
		add: #list;
		yourself
]

{ #category : 'initialization' }
WidgetClassListPresenter >> initializePresenters [

	list := self newList.
	list items: (SpAbstractWidgetPresenter allSubclasses sorted: [:a :b | a name < b name ]).
	self focusOrder add: list
]

{ #category : 'initialization' }
WidgetClassListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: 'Widgets'
]

{ #category : 'api' }
WidgetClassListPresenter >> whenSelectionChangedDo: aBlock [

	list whenSelectionChangedDo: aBlock
]
