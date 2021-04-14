"
Description
--------------------

Abstract superclass of all Seaside components of AsdEinkaufenBackend. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #ASDEComponent,
	#superclass : #WAComponent,
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #convenience }
ASDEComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
ASDEComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
ASDEComponent >> rootComponent [
	^ self session rootComponent
]
