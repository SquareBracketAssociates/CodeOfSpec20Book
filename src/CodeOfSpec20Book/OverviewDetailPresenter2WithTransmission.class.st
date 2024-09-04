"
I am the overview-detail presenter with a transformation for the text.
"
Class {
	#name : 'OverviewDetailPresenter2WithTransmission',
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
OverviewDetailPresenter2WithTransmission >> connectPresenters [

	overview
		transmitTo: detail
		transform: [ :selectedPoint |
			selectedPoint
				ifNil: [ '' ]
				ifNotNil: [ (selectedPoint distanceTo: 0@0) asString ] ]
]

{ #category : 'initialization' }
OverviewDetailPresenter2WithTransmission >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter2WithTransmission >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
