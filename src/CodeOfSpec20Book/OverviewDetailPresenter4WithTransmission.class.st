"
I am the overview-detail presenter with a post-transmission action.
"
Class {
	#name : 'OverviewDetailPresenter4WithTransmission',
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
OverviewDetailPresenter4WithTransmission >> connectPresenters [

	overview
		transmitTo: detail
		transform: [ :selectedPoint |
			selectedPoint
				ifNil: [ '' ]
				ifNotNil: [ (selectedPoint distanceTo: 0@0) asString ] ]
		postTransmission: [ :destination | destination selectAll ].
	overview transmitDo: [ :selectedPoint | selectedPoint crTrace ]
]

{ #category : 'initialization' }
OverviewDetailPresenter4WithTransmission >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter4WithTransmission >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
