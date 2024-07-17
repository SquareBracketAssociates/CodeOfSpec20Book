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
		'athensPresenter'
	],
	#category : 'CodeOfSpec20Book-Chapter15',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter15'
}

{ #category : 'layout' }
AthensExamplePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: athensPresenter;
		yourself
]

{ #category : 'initialization' }
AthensExamplePresenter >> initializePresenters [

	athensPresenter := self instantiate: SpAthensPresenter.
	athensPresenter surfaceExtent: 600@400.
	athensPresenter drawBlock: [ :canvas | self render: canvas ]
]

{ #category : 'initialization' }
AthensExamplePresenter >> render: canvas [

	"| surface |
	surface := canvas surface.
	canvas
		setPaint:
			(surface
				createLinearGradient: {
					0 -> Color white.
					1 -> Color black }
				start: 0@0
				stop: surface extent).
	canvas drawShape: (0 @ 0 extent: surface extent)"
	
	| paint surface font |
			surface := canvas surface.
		"	paint := surface
				createLinearGradient: {
					0->Color red.
					1->Color green }
				start: 0@0
				stop: surface extent.
			surface clear.
			canvas setPaint: paint.
			canvas drawShape: (0@0 corner: surface extent)."

	font := LogicalFont familyName: 'Source Sans Pro' pointSize: 10.
		surface clear.
		canvas setPaint: ((LinearGradientPaint from: 0@0  to: surface extent) 
			colorRamp: {  0 -> Color white. 1 -> Color black }).
		canvas drawShape: (0@0 extent: surface extent).
		canvas setFont: font.
		canvas setPaint: Color pink.
		canvas pathTransform translateX: 20 Y: 20 + (font getPreciseAscent); scaleBy: 2; rotateByDegrees: 25.
		canvas drawString: 'Hello Athens in Pharo/Morphic'
]
