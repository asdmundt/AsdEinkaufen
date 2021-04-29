Class {
	#name : #ASDEShopRegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'register'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #hooks }
ASDEShopRegisterComponent >> children [
	^ {self register}
]

{ #category : #initalize }
ASDEShopRegisterComponent >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEShopRegisterComponent >> register [
	^ register
]

{ #category : #accessing }
ASDEShopRegisterComponent >> register: anObject [
	register := anObject
]

{ #category : #rendering }
ASDEShopRegisterComponent >> renderContentOn: html [
html
		form:[
	html render: register ]
]
