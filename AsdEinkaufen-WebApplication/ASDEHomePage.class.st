"
Description
--------------------

TODO
"
Class {
	#name : #ASDEHomePage,
	#superclass : #ASDEPage,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEHomePage class >> pageName [
	^ 'Hello world'
]

{ #category : #accessing }
ASDEHomePage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDEHomePage >> renderContentOn: html [
	html mdlGrid
		style: 'align-items: center; height: 200px; width:100%; ';
		with: [ html mdlCell
				stretch;
				size: 12;
				with: [ html div
						with: [ html text: 'Willkommen auf Ihrer Online Shopping Tour' ] ] ]
]
