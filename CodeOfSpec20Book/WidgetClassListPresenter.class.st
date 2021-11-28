"
should be revisited
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
	list
		whenSelectionChangedDo: [ :selection | aBlock cull: selection selectedItem ]
]
