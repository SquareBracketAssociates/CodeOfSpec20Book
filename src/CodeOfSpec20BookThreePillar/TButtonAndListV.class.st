Class {
	#name : #TButtonAndListV,
	#superclass : #SpButtonAndListH,
	#category : #CodeOfSpec20BookThreePillar
}

{ #category : #'instance creation' }
TButtonAndListV class >> open [ 

	<script>
	super open
]

{ #category : #initialization }
TButtonAndListV >> initializePresenters [

	super initializePresenters.

	buttons beCol
]
