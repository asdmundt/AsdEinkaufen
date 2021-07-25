Class {
	#name : #ASDChannel,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'content'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #accessing }
ASDChannel >> content [
	^ content
]

{ #category : #accessing }
ASDChannel >> content: anObject [
	content := anObject
]

{ #category : #initialization }
ASDChannel >> initialize [ 
super initialize 
]
