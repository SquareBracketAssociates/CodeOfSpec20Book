Class {
	#name : 'BaselineOfCodeOfSpec20Book',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCodeOfSpec20Book',
	#package : 'BaselineOfCodeOfSpec20Book'
}

{ #category : 'baselines' }
BaselineOfCodeOfSpec20Book >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'CodeOfSpec20Book';
				package: 'CodeOfSpec20Book-Extensions']
]
