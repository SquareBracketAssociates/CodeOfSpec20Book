Class {
	#name : 'ProtocolMethodListPresenterTest',
	#superclass : 'TestCase',
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'tests' }
ProtocolMethodListPresenterTest >> testItems [

	| proto methods |
	methods := Point methods sort: #selector ascending.
	proto := ProtocolMethodListPresenter new.
	proto items: methods.
	self assert: proto methods items first class equals: CompiledMethod.
	self assert: proto methods items first selector equals: methods first selector
]
