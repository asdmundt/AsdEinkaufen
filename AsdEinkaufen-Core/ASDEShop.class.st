Class {
	#name : #ASDEShop,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'titel',
		'logoBild',
		'titleText',
		'text',
		'cssFile',
		'name',
		'userId'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #accessing }
ASDEShop >> cssFile [
	^ cssFile
]

{ #category : #accessing }
ASDEShop >> cssFile: anObject [
	cssFile := anObject
]

{ #category : #'magrittes-descriptions' }
ASDEShop >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: MDLMAFormRenderer;
		yourself
]

{ #category : #accessing }
ASDEShop >> logoBild [
	^ logoBild
]

{ #category : #accessing }
ASDEShop >> logoBild: anObject [
	logoBild := anObject
]

{ #category : #accessing }
ASDEShop >> name [
	^ name
]

{ #category : #accessing }
ASDEShop >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDEShop >> titel [
	^ self maLazyFrom: self descriptionTitel
]

{ #category : #accessing }
ASDEShop >> titel: anObject [
	titel := anObject
]

{ #category : #accessing }
ASDEShop >> userId [
	^ userId
]

{ #category : #accessing }
ASDEShop >> userId: anObject [
	userId := anObject
]
