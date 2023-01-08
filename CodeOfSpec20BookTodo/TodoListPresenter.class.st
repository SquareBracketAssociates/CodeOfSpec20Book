"
```
TodoApplication new run.
```
"
Class {
	#name : #TodoListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #'instance creation' }
TodoListPresenter class >> open [ 
	<script>
	self new open
]

{ #category : #initialization }
TodoListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		                     addColumn:
			                     ((SpCheckBoxTableColumn evaluated: [ :task |
					                       task isDone ]) width: 20;
											onActivation: [ :task | task done: true ];
											onDeactivation: [ :task | task done: false ];
											yourself
				
				
				);
		                     addColumn:
			                     (SpStringTableColumn
				                      title: 'Title'
				                      evaluated: [ :task | task title ]);
		                     yourself.
	self layout: (SpBoxLayout newTopToBottom
			 add: todoListPresenter;
			 yourself)
]

{ #category : #initialization }
TodoListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Todo List';
		initialExtent: 500@500
]

{ #category : #initialization }
TodoListPresenter >> updatePresenter [
	todoListPresenter items: TodoTask tasks
]
