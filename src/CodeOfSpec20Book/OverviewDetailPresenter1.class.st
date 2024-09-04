"
I am the basic overview-detail presenter illustrated in the book.
"
Class {
	#name : 'OverviewDetailPresenter1',
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
OverviewDetailPresenter1 >> connectPresenters [

	overview whenSelectedItemChangedDo: [ :selectedPoint |
		detail text: selectedPoint asString ]
]

{ #category : 'initialization' }
OverviewDetailPresenter1 >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: overview expand: false;
		add: detail;
		yourself
]

{ #category : 'initialization' }
OverviewDetailPresenter1 >> initializePresenters [

	overview := self newList
		items: { 1@1 . 7@5 . 10@15 . 12@0 . 0@ -9 . -5@ -5 };
		yourself.
	detail := self newText
]
