"
I am the basic overview-detail presenter with transmissions.
"
Class {
	#name : 'OverviewDetailPresenter1WithTransmission',
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
OverviewDetailPresenter1WithTransmission >> connectPresenters [

	overview
		transmitTo: detail
		transform: [ :selectedPoint | selectedPoint asString ]
]

{ #category : 'initialization' }
OverviewDetailPresenter1WithTransmission >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter1WithTransmission >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
