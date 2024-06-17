"
`TodoApplication new run`
"
Class {
	#name : 'TodoApplication',
	#superclass : 'SpApplication',
	#category : 'CodeOfSpec20Book-Chapter20',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter20'
}

{ #category : 'accessing' }
TodoApplication >> start [ 

	TodoListPresenter open
]
