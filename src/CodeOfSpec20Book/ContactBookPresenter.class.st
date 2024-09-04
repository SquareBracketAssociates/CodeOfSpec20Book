"
I am the presenter for a `ContactBook`.
"
Class {
	#name : 'ContactBookPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table',
		'contactBook'
	],
	#category : 'CodeOfSpec20Book-Chapter18',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter18'
}

{ #category : 'examples' }
ContactBookPresenter class >> coworkersExample [

	<example>
	(self on: ContactBook coworkers) open
]

{ #category : 'layout' }
ContactBookPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		add: #table;
		yourself
]

{ #category : 'initialization' }
ContactBookPresenter >> initializePresenters [

	table := self newTable
		addColumn: (SpStringTableColumn title: 'Name' evaluated: [ :contact | contact name ]);
		addColumn: (SpStringTableColumn title: 'Phone' evaluated: [ :contact | contact phone ]);
		items: contactBook contents;
		yourself
]

{ #category : 'testing' }
ContactBookPresenter >> isContactSelected [

	^ table selectedItems isNotEmpty
]

{ #category : 'actions' }
ContactBookPresenter >> newContact [

	| rawData split |
	 rawData := self
		request: 'Enter new contact name and phone (split by comma)'
		initialAnswer: ''
		title: 'Create new contact'.
	split := rawData splitOn: $,.
	(split size = 2 and: [ split allSatisfy: [ :each | each isNotEmpty ]])
		ifFalse: [ SpInvalidUserInputError signal: 'Please enter contact name and phone (split by comma)' ].

	^ Contact name: split first phone: split second
]

{ #category : 'testing' }
ContactBookPresenter >> selectedContact [

	^ table selection selectedItem
]

{ #category : 'accessing' }
ContactBookPresenter >> setModelBeforeInitialization: aContactBook [

	super setModelBeforeInitialization: aContactBook.
	contactBook := aContactBook
]
