"
`TodoApplication new run`
"
Class {
	#name : 'TodoApplication',
	#superclass : 'SpApplication',
	#category : 'CodeOfSpec20Book-Chapter21',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter21'
}

{ #category : 'accessing' }
TodoApplication >> start [ 

	TodoListPresenter open
]
