Class {
	#name : #ASDEKategorie,
	#superclass : #ASDEEinkaufen,
	#instVars : [
		'name',
		'title'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #'instance creation' }
ASDEKategorie class >> name: aName andTitle: aTitle [
	^ self new
		name: aName;
		title: aTitle;
		
		yourself
]

{ #category : #accessing }
ASDEKategorie >> name [
	^ name
]

{ #category : #accessing }
ASDEKategorie >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASDEKategorie >> title [
	^ title
]

{ #category : #accessing }
ASDEKategorie >> title: anObject [
	title := anObject
]
