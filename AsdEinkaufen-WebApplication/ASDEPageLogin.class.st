Class {
	#name : #ASDEPageLogin,
	#superclass : #ASDEComponent,
	#instVars : [
		'displayComponent'
	],
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDEPageLogin class >> isAbstract [
	^ self = ASDBPageLogin
]

{ #category : #accessing }
ASDEPageLogin class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
ASDEPageLogin class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
ASDEPageLogin class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
ASDEPageLogin class >> priority [
	^ self subclassResponsibility
]

{ #category : #hooks }
ASDEPageLogin >> children [
	^ {}
]

{ #category : #accessing }
ASDEPageLogin >> displayComponent [
	^ displayComponent
]

{ #category : #accessing }
ASDEPageLogin >> displayComponent: anObject [
	displayComponent := anObject
]

{ #category : #initialization }
ASDEPageLogin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEPageLogin >> pathName [
	^ self class pathName
]

{ #category : #rendering }
ASDEPageLogin >> renderAddButtonsOn: html [
	html break.
	html mdlGrid
		shadow: 0;
		style: 'height: 50px;';
		with: [ html mdlCell
				class: 'grid-cell-demo';
				top;
				size: 1.
			html mdlCell
				class: 'grid-cell-demo';
				top;
				size: 10;
				with: [ self renderSelfNewButtonOn: html.
					].
			html mdlCell
				class: 'grid-cell-demo';
				top;
				size: 1 ]
]
