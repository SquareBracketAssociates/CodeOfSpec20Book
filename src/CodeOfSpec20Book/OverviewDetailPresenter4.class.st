"
I am the overview-detail presenter with an action after setting the text.
"
Class {
	#name : 'OverviewDetailPresenter4',
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
OverviewDetailPresenter4 >> connectPresenters [

	overview whenSelectedItemChangedDo: [ :selectedPoint |
		| distanceToOrigin |
		distanceToOrigin := selectedPoint
			ifNil: [ '' ]
			ifNotNil: [ (selectedPoint distanceTo: 0@0) asString ].
		detail text: distanceToOrigin.
		detail selectAll.
		selectedPoint crTrace ]
]

{ #category : 'initialization' }
OverviewDetailPresenter4 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter4 >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
