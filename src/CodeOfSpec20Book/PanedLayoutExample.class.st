"
I use a paned layout to make two lists resizable.
"
Class {
	#name : 'PanedLayoutExample',
	#superclass : 'SpPresenter',
	#instVars : [
		'leftList',
		'rightList'
	],
	#category : 'CodeOfSpec20Book-Chapter10',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter10'
}

{ #category : 'layout' }
PanedLayoutExample >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		positionOfSlider: 70 percent;
		add: #leftList withConstraints: [ :constraints | constraints beNotShrinkable ];
		add: #rightList;
		yourself
]

{ #category : 'initialization' }
PanedLayoutExample >> initializePresenters [

	leftList := self newList
		items: (1 to: 10);
		yourself.
	rightList := self newList
		items: ($a to: $z);
		yourself
]
