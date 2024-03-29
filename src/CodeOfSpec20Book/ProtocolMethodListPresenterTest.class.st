Class {
	#name : #ProtocolMethodListPresenterTest,
	#superclass : #TestCase,
	#category : #'CodeOfSpec20Book-MiniClassBrowser'
}

{ #category : #tests }
ProtocolMethodListPresenterTest >> testItems [

	| proto methods |
	methods := Point methods sort: #selector ascending.
	proto := ProtocolMethodListPresenter new.
	proto items: methods.
	self assert: proto methods items first class equals: CompiledMethod.
	self assert: proto methods items first selector equals: methods first selector
]
