Class {
	#name : #ASDEForm,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'model',
		'htmlId'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #'instance creation' }
ASDEForm class >> withModel: aModel [
	^ self new
		model: aModel;
		yourself
]

{ #category : #accessing }
ASDEForm >> htmlId [
	^ htmlId
]

{ #category : #accessing }
ASDEForm >> htmlId: anObject [
	htmlId := anObject
]

{ #category : #accessing }
ASDEForm >> model [
	^ model
]

{ #category : #accessing }
ASDEForm >> model: anObject [
	model := anObject
]
