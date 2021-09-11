Class {
	#name : #ASDEPageShopOwner,
	#superclass : #ASDEComponent,
	#instVars : [
		'displayComponent',
		'shop'
	],
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDEPageShopOwner class >> isAbstract [
	^ self = ASDEPageAdmin
]

{ #category : #accessing }
ASDEPageShopOwner class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPageShopOwner class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDEPageShopOwner class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDEPageShopOwner class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDEPageShopOwner >> children [
	^ {}
]

{ #category : #accessing }
ASDEPageShopOwner >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDEPageShopOwner >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDEPageShopOwner >> initialize [
	super initialize.
	self shop: self session shop
]

{ #category : #accessing }
ASDEPageShopOwner >> pathName [
	^ self class pathName
]

{ #category : #accessing }
ASDEPageShopOwner >> shop [
	^ shop
]

{ #category : #accessing }
ASDEPageShopOwner >> shop: anObject [
	shop := anObject
]
