"
I am a sample Morph that paints using an Athens Canvas.

```
AthensHello new openInWindow
```
"
Class {
	#name : 'AthensHello',
	#superclass : 'Morph',
	#instVars : [
		'surface'
	],
	#category : 'CodeOfSpec20Book-Chapter16',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter16'
}

{ #category : 'accessing' }
AthensHello >> defaultExtent [

	^ 400@400
]

{ #category : 'initialization' }
AthensHello >> drawOn: aCanvas [

	self renderAthens.
	surface displayOnMorphicCanvas: aCanvas at: bounds origin
]

{ #category : 'accessing' }
AthensHello >> extent: aPoint [

	| newExtent |
	newExtent := aPoint rounded.
	(bounds extent closeTo: newExtent) ifTrue: [ ^ self ].
	bounds := bounds topLeft extent: newExtent.
	surface := AthensCairoSurface extent: newExtent.
	self layoutChanged.
	self changed
]

{ #category : 'initialization' }
AthensHello >> initialize [

	super initialize.
	self extent: self defaultExtent.
	surface := AthensCairoSurface extent: self extent
]

{ #category : 'initialization' }
AthensHello >> renderAthens [

	| font |
	font := LogicalFont familyName: 'Source Sans Pro' pointSize: 10.
	surface drawDuring: [ :canvas |
		surface clear.
		canvas setPaint: ((LinearGradientPaint from: 0@0  to: self extent) colorRamp: {  0 -> Color white. 1 -> Color black }).
		canvas drawShape: (0@0 extent: self extent).
		canvas setFont: font.
		canvas setPaint: Color pink.
		canvas pathTransform translateX: 20 Y: 20 + (font getPreciseAscent); scaleBy: 2; rotateByDegrees: 25.
		canvas drawString: 'Hello Athens in Pharo/Morphic' ]
]
