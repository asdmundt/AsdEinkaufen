Class {
	#name : #ASDEPageAdmin,
	#superclass : #ASDEComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDEPageAdmin class >> isAbstract [
	^ self = ASDEPageAdmin
]

{ #category : #accessing }
ASDEPageAdmin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPageAdmin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDEPageAdmin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDEPageAdmin class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDEPageAdmin >> children [
	^ {}
]

{ #category : #accessing }
ASDEPageAdmin >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDEPageAdmin >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDEPageAdmin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEPageAdmin >> pathName [
	^ self class pathName
]
