Class {
	#name : 'TodoTaskPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : 'CodeOfSpec20Book-Chapter20',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter20'
}

{ #category : 'initialization' }
TodoTaskPresenter >> accept [

	self task 
		title: titlePresenter text;
		save.
]

{ #category : 'initialization' }
TodoTaskPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter 
		title: 'New task';
		initialExtent: 350@120;
		addButton: 'Accept' do: [ :dialog |
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog |
			dialog close ]
]

{ #category : 'initialization' }
TodoTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.

	self layout: (SpBoxLayout newTopToBottom
				add: titlePresenter expand: false;
				yourself)
]

{ #category : 'accessing' }
TodoTaskPresenter >> task [

	^ task
]

{ #category : 'accessing' }
TodoTaskPresenter >> task: aTask [

	task := aTask.
	self updatePresenter
]

{ #category : 'initialization' }
TodoTaskPresenter >> updatePresenter [

	task ifNotNil: [  
		titlePresenter text: (task title ifNil: [ '' ]) ]
]
