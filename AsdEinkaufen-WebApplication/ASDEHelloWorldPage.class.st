"
Description
--------------------

TODO
"
Class {
	#name : #ASDEHelloWorldPage,
	#superclass : #ASDEPage,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEHelloWorldPage class >> pageName [
	^ 'Hello world'
]

{ #category : #accessing }
ASDEHelloWorldPage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDEHelloWorldPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
