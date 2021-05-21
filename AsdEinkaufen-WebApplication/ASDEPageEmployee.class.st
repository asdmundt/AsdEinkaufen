Class {
	#name : #ASDEPageEmployee,
	#superclass : #ASDEComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDEPageEmployee class >> isAbstract [
	^ self = ASDEPageAdmin
]

{ #category : #accessing }
ASDEPageEmployee class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPageEmployee class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDEPageEmployee class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDEPageEmployee class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDEPageEmployee >> children [
	^ {}
]

{ #category : #accessing }
ASDEPageEmployee >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDEPageEmployee >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDEPageEmployee >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEPageEmployee >> pathName [
	^ self class pathName
]
