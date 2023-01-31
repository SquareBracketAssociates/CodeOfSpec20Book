Class {
	#name : #TButtonAndListV2,
	#superclass : #SpButtonAndListH,
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #layout }
TButtonAndListV2 >> defaultLayout [

	"TButtonAndListV2 new open "

	^ SpBoxLayout new
		  add: buttons layout: #buttonCol;
		  add: list;
		  yourself
]
