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
		'userId',
		'ausliefernJIT',
		'category'
	],
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #voyage }
ASDEShop class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #'instance creation' }
ASDEShop class >> userId: anInteger [
	^ self new
		userId: anInteger;
		yourself
]

{ #category : #accessing }
ASDEShop >> ausliefernJIT [
	^ ausliefernJIT
]

{ #category : #accessing }
ASDEShop >> ausliefernJIT: anObject [
	ausliefernJIT := anObject
]

{ #category : #accessing }
ASDEShop >> category [
	^ category
]

{ #category : #accessing }
ASDEShop >> category: anObject [
	category := anObject
]

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

{ #category : #initialization }
ASDEShop >> initialize [
	super initialize.
	
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
ASDEShop >> text [
	^ text
]

{ #category : #accessing }
ASDEShop >> text: anObject [
	text := anObject
]

{ #category : #accessing }
ASDEShop >> titel [
	^ titel
]

{ #category : #accessing }
ASDEShop >> titel: anObject [
	titel := anObject
]

{ #category : #accessing }
ASDEShop >> titleText [
	^ titleText
]

{ #category : #accessing }
ASDEShop >> titleText: anObject [
	titleText := anObject
]

{ #category : #accessing }
ASDEShop >> userId [
	^ userId
]

{ #category : #accessing }
ASDEShop >> userId: anObject [
	userId := anObject
]
