Class {
	#name : #TodoTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#classInstVars : [
		'tasks'
	],
	#category : #CodeOfSpec20BookTodo
}

{ #category : #'as yet unclassified' }
TodoTask class >> populateDB [
	<script>
	TodoTask new
		title: 'Task One';
		save.
	TodoTask new
		title: 'Task Two';
		save
]

{ #category : #accessing }
TodoTask class >> tasks [ 

	^ tasks ifNil: [ tasks := OrderedCollection new]
]

{ #category : #accessing }
TodoTask >> done [

	^ done
]

{ #category : #accessing }
TodoTask >> done: anObject [

	done := anObject
]

{ #category : #initialization }
TodoTask >> initialize [

	super initialize.
	self done: false
]

{ #category : #testing }
TodoTask >> isDone [

	^ self done
]

{ #category : #saving }
TodoTask >> save [

	self class tasks add: self
]

{ #category : #accessing }
TodoTask >> title [

	^ title
]

{ #category : #accessing }
TodoTask >> title: anObject [

	title := anObject
]
