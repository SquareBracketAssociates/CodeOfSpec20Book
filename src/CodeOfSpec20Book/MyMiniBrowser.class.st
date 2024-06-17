"
I am a small browser that shows classes, methods, and the source code of a method.
I have a button to toggle the code presenter between edit mode and read-only mode.
"
Class {
	#name : 'MyMiniBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'classTree',
		'code',
		'methodList',
		'button'
	],
	#category : 'CodeOfSpec20Book-Chapter11',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter11'
}

{ #category : 'private' }
MyMiniBrowser >> buttonAction [

	| newCode |
	button label = 'Edit'
		ifTrue: [
			button label: 'Read only'.
			newCode := self newCode
				beForMethod: methodList selectedItem;
				text: methodList selectedItem ast formattedCode;
			yourself ]
		ifFalse: [
			button label: 'Edit'.
			newCode := self newText
				text: methodList selectedItem ast formattedCode;
				beNotEditable;
				yourself ].

	self layout replace: code with: newCode.
	code := newCode
]

{ #category : 'initialization' }
MyMiniBrowser >> connectPresenters [

	classTree whenActivatedDo: [ :selection |
		methodList items: selection selectedItem methods ].
	 methodList listPresenter
		whenSelectedDo: [ :selectedMethod |
			code text: selectedMethod ast formattedCode ].
	button action: [ self buttonAction ]
]

{ #category : 'layout' }
MyMiniBrowser >> defaultLayout [

	| classesAndMethodsLayout |
	classesAndMethodsLayout := SpBoxLayout newLeftToRight.
	classesAndMethodsLayout
		spacing: 10;
		add: classTree;
		add: methodList.
	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: classesAndMethodsLayout;
		add: code;
		add: button expand: false;
		yourself
]

{ #category : 'initialization' }
MyMiniBrowser >> initializePresenters [

	classTree := self newTree
		activateOnSingleClick;
		roots: { Object };
		children: [ :each | each subclasses ];
		displayIcon: [ :each | self iconNamed: each systemIconName ];
		yourself.
	methodList := self newFilteringList display: [ :method |
		method selector ].
	methodList listPresenter sortingBlock:
		[ :method | method selector ] ascending.
	button := self newButton
		label: 'Edit';
		icon: (self iconNamed: #smallConfiguration);
		yourself.
	code := self newText.
	code beNotEditable
]

{ #category : 'initialization' }
MyMiniBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
	title: 'My Mini Browser';
	initialExtent: 750@650
]
