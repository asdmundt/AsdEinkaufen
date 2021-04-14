Class {
	#name : #ASDEEinkaufen,
	#superclass : #Object,
	#instVars : [
		'status',
		'task',
		'states',
		'id'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #voyage }
ASDEEinkaufen class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #actions }
ASDEEinkaufen >> addTask: aTask [
self task add: aTask.
]

{ #category : #accessing }
ASDEEinkaufen >> id [
	^ id
]

{ #category : #accessing }
ASDEEinkaufen >> id: anObject [
	id := anObject
]

{ #category : #initialize }
ASDEEinkaufen >> initialize [
	super initialize.
	self task: OrderedCollection new.
	states := OrderedCollection
		newFrom: {'new' . 'editing' . 'ready' . 'delivering' . 'done' . 'notReady'}.
	self status: 'new'.	
]

{ #category : #accessing }
ASDEEinkaufen >> states [
	^ states
]

{ #category : #accessing }
ASDEEinkaufen >> status [
	^ status
]

{ #category : #accessing }
ASDEEinkaufen >> status: anObject [
	status := anObject
]

{ #category : #accessing }
ASDEEinkaufen >> task [
	^ task
]

{ #category : #accessing }
ASDEEinkaufen >> task: anObject [
	task := anObject
]
