"
I demonstrate the usage of **SpAthensPresenter**

```
AthensExamplePresenter new open
```
"
Class {
	#name : 'AthensExamplePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'paintPresenter'
	],
	#category : 'CodeOfSpec20Book-Chapter16',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter16'
}

{ #category : 'layout' }
AthensExamplePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: paintPresenter;
		yourself
]

{ #category : 'initialization' }
AthensExamplePresenter >> initializePresenters [

	paintPresenter := self instantiate: SpAthensPresenter.
	paintPresenter surfaceExtent: 600@400.
	paintPresenter drawBlock: [ :canvas | self render: canvas ]
]

{ #category : 'initialization' }
AthensExamplePresenter >> render: canvas [

	canvas
		setPaint:
			(canvas surface
				createLinearGradient: {
					0 -> Color white.
					1 -> Color black }
				start: 0@0
				stop: canvas surface extent).
	canvas drawShape: (0 @ 0 extent: canvas surface extent)
]
