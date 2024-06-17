Class {
	#name : 'ColorChooserApplicationTest',
	#superclass : 'TestCase',
	#instVars : [
		'application'
	],
	#category : 'CodeOfSpec20Book-Chapter05',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter05'
}

{ #category : 'running' }
ColorChooserApplicationTest >> setUp [

	super setUp.
	application := ColorChooserApplication new
]

{ #category : 'running' }
ColorChooserApplicationTest >> tearDown [

	application ifNotNil: [ application closeAllWindows ].
	super tearDown
]

{ #category : 'tests' }
ColorChooserApplicationTest >> testWindowRegistration [

	self assert: application windows size equals: 0.
	application start.
	self assert: application windows size equals: 1.
	application start.
	self assert: application windows size equals: 2
]
