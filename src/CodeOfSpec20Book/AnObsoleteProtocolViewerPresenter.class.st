"
`ProtocolViewerPresenter new open` at least!
"
Class {
	#name : 'AnObsoleteProtocolViewerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'models',
		'api',
		'events'
	],
	#category : 'CodeOfSpec20Book-Chapter08',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter08'
}

{ #category : 'examples' }
AnObsoleteProtocolViewerPresenter class >> example [

	self new open
]

{ #category : 'examples' }
AnObsoleteProtocolViewerPresenter class >> exampleHorizontal [

	| instance |
    instance := self new.
    instance openWithLayout: instance horizontalLayout
]
