"
Description
--------------------

Simple session for the AsdEinkaufenBackend. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #ASDESession,
	#superclass : #WASession,
	#instVars : [
		'currentUser',
		'rootComponent',
		'task',
		'model',
		'loginError',
		'adminView',
		'userId'
	],
	#category : #'AsdEinkaufen-WebApplication-Utils'
}

{ #category : #accessing }
ASDESession >> adminView [
	^ adminView
]

{ #category : #accessing }
ASDESession >> adminView: anObject [
	adminView := anObject
]

{ #category : #accessing }
ASDESession >> currentUser [
	^ currentUser
]

{ #category : #accessing }
ASDESession >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #initialization }
ASDESession >> initialize [
	super initialize.
	self model: ASDEDbModelPortal current.
	self adminView: false
]

{ #category : #testing }
ASDESession >> isLogged [
	^ self currentUser notNil
]

{ #category : #accessing }
ASDESession >> loginError [
	^ loginError
]

{ #category : #accessing }
ASDESession >> loginError: anObject [
	loginError := anObject
]

{ #category : #accessing }
ASDESession >> model [
	^ model
]

{ #category : #accessing }
ASDESession >> model: anObject [
	model := anObject
]

{ #category : #actions }
ASDESession >> reset [
		currentUser := nil.
	self requestContext redirectTo: self application url.
	self unregister
]

{ #category : #actions }
ASDESession >> resetStates [
	task := nil
]

{ #category : #accessing }
ASDESession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
ASDESession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]

{ #category : #accessing }
ASDESession >> task [
	^ task
]

{ #category : #accessing }
ASDESession >> task: anObject [
	task := anObject
]

{ #category : #accessing }
ASDESession >> userId [
	^ userId
]

{ #category : #accessing }
ASDESession >> userId: anObject [
	userId := anObject
]
