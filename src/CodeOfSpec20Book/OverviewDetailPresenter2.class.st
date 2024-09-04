"
I am the overview-detail presenter with a computed value for the text.
"
Class {
	#name : 'OverviewDetailPresenter2',
	#superclass : 'SpPresenter',
	#instVars : [
		'overview',
		'detail'
	],
	#category : 'CodeOfSpec20Book-Chapter14',
	#package : 'CodeOfSpec20Book',
	#tag : 'Chapter14'
}

{ #category : 'initialization' }
OverviewDetailPresenter2 >> connectPresenters [

	overview whenSelectedItemChangedDo: [ :selectedPoint |
		| distanceToOrigin |
		distanceToOrigin := selectedPoint
			ifNil: [ '' ]
			ifNotNil: [ (selectedPoint distanceTo: 0@0) asString ].
		detail text: distanceToOrigin ]
]

{ #category : 'initialization' }
OverviewDetailPresenter2 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter2 >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
