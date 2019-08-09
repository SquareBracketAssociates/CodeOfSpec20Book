Class {
	#name : #BookScriptTest,
	#superclass : #TestCase,
	#instVars : [
		'instance'
	],
	#category : #CodeOfSpec20Book
}

{ #category : #tests }
BookScriptTest >> tearDown [
	
	instance window close 
]

{ #category : #tests }
BookScriptTest >> testColorNames [
	
	instance := BookScripts colorNames.
	self assert: instance items first equals: 'black'
]

{ #category : #tests }
BookScriptTest >> testColors [
	
	instance := BookScripts allInstances.
	self assert: instance items first class equals: Color.
]

{ #category : #tests }
BookScriptTest >> testTriplets [
	
	instance := BookScripts triplet.
	self assert: instance items first class equals: Color.
]
