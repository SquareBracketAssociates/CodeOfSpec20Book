"
```
TodoApplication new run.
```
"
Class {
	#name : 'TodoListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'todoListPresenter',
		'addButton'
	],
	#category : 'CodeOfSpec20Book-Chapter20',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter20'
}

{ #category : 'instance creation' }
TodoListPresenter class >> open [ 
	<script>
	self new open
]

{ #category : 'initialization' }
TodoListPresenter >> addTask [

	(TodoTaskPresenter newApplication: self application) 
		task: TodoTask new;
		openModal.
	self updatePresenter
]

{ #category : 'initialization' }
TodoListPresenter >> defaultLayout [ 
	
	^ (SpBoxLayout newTopToBottom 
		add: todoListPresenter;
		add: (SpBoxLayout newLeftToRight
				addLast: addButton expand: false;
				yourself) 
		expand: false;
		yourself)
]

{ #category : 'initialization' }
TodoListPresenter >> editSelectedTask [

	(TodoTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
		openModal.
	self updatePresenter
]

{ #category : 'initialization' }
TodoListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		                     addColumn:
			                     ((SpCheckBoxTableColumn evaluated: [ :task | 
					                       task isDone ])
				                      width: 20;
				                      onActivation: [ :task | task done: true ];
				                      onDeactivation: [ :task | task done: false ];
				                      yourself);
		                     addColumn:
		                     (SpStringTableColumn
			                      title: 'Title'
			                      evaluated: [ :task | task title ]);	
		                     yourself.
	todoListPresenter contextMenu: self todoListContextMenu.
	
	addButton := self newButton
		             label: 'Add task';
		             action: [ self addTask ];
		             yourself
]

{ #category : 'initialization' }
TodoListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Todo List';
		initialExtent: 500@500
]

{ #category : 'initialization' }
TodoListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem delete.
	self updatePresenter
]

{ #category : 'initialization' }
TodoListPresenter >> todoListContextMenu [

	^ self newMenu 
		addItem: [ :item | item 
						name: 'Edit...'; 
						action: [ self editSelectedTask ] ];
		addItem: [ :item | item 
						name: 'Remove'; 
						action: [ self removeSelectedTask ] ]
]

{ #category : 'initialization' }
TodoListPresenter >> updatePresenter [
	todoListPresenter items: TodoTask tasks
]
