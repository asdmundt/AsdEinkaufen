"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #ASDEPage,
	#superclass : #ASDEComponent,
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDEPage class >> isAbstract [
	^ self = ASDEPage
]

{ #category : #accessing }
ASDEPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDEPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDEPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPage >> pathName [
	^ self class pathName
]
