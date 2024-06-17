Class {
	#name : 'TodoTask',
	#superclass : 'Object',
	#instVars : [
		'done',
		'title'
	],
	#classInstVars : [
		'tasks'
	],
	#category : 'CodeOfSpec20Book-Chapter20',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter20'
}

{ #category : 'task management' }
TodoTask class >> addTask: aTask [
	
	(self tasks includes: aTask)
		ifFalse: [ self tasks add: aTask ]
]

{ #category : 'task management' }
TodoTask class >> deleteTask: aTask [

	self tasks remove: aTask ifAbsent: [ nil ]
]

{ #category : 'accessing' }
TodoTask class >> populateDB [
	<script>
	
	TodoTask new
		title: 'Task One';
		save.
	TodoTask new
		title: 'Task Two';
		save
]

{ #category : 'task management' }
TodoTask class >> tasks [ 

	^ tasks ifNil: [ tasks := OrderedCollection new]
]

{ #category : 'saving' }
TodoTask >> delete [

	self class deleteTask: self
]

{ #category : 'accessing' }
TodoTask >> done [

	^ done
]

{ #category : 'accessing' }
TodoTask >> done: anObject [

	done := anObject
]

{ #category : 'initialization' }
TodoTask >> initialize [

	super initialize.
	self done: false.
	self title: 'Please give me a title'
]

{ #category : 'testing' }
TodoTask >> isDone [

	^ self done
]

{ #category : 'printing' }
TodoTask >> printOn: aStream [
	super printOn: aStream.
	aStream space nextPutAll: self title.
]

{ #category : 'saving' }
TodoTask >> save [

	self class addTask: self
]

{ #category : 'accessing' }
TodoTask >> title [

	^ title
]

{ #category : 'accessing' }
TodoTask >> title: anObject [

	title := anObject
]
