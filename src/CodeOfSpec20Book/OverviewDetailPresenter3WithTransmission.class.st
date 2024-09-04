"
I am the overview-detail presenter with a transmission for logging.
"
Class {
	#name : 'OverviewDetailPresenter3WithTransmission',
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
OverviewDetailPresenter3WithTransmission >> connectPresenters [

	overview
		transmitTo: detail
		transform: [ :selectedPoint |
			selectedPoint
				ifNil: [ '' ]
				ifNotNil: [ (selectedPoint distanceTo: 0@0) asString ] ].
	overview transmitDo: [ :selectedPoint | selectedPoint crTrace ]
]

{ #category : 'initialization' }
OverviewDetailPresenter3WithTransmission >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter3WithTransmission >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
