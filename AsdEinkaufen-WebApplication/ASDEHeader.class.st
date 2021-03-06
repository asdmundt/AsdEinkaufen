"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDEHeader,
	#superclass : #ASDEComponent,
	#instVars : [
		'foldButton'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEHeader >> foldButton [
	^ foldButton
]

{ #category : #accessing }
ASDEHeader >> foldButton: anObject [
	foldButton := anObject
]

{ #category : #initialize }
ASDEHeader >> initialize [
	super initialize.
	self
		foldButton: (MDLFoldButton for: '#' , 'rightPanel--right-panel') fold;
		yourself
]

{ #category : #accessing }
ASDEHeader >> possiblePages [
	self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDEPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDEPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDEPage pagesToDisplay ]
]

{ #category : #rendering }
ASDEHeader >> renderAccountButtonOn: html [
	html
		mdlNavigation: [ html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #account_circle ].
			html mdlMenu
				bottomRight;
				for: #bottomLeftButton;
				with: [ html div
						style: 'width: 250px; height:650px;';
						with: [ html text: 'test' ] ] ]
]

{ #category : #rendering }
ASDEHeader >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ html mdlNavigation: [ html render: self foldButton..self renderAccountButtonOn: html ] ]
]

{ #category : #rendering }
ASDEHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html mdlLayoutTitle: 'Einkaufen in Frankfurt' ].
					html mdlLayoutSpacer.
					self renderButtonsOn: html  ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
ASDEHeader >> renderDrawerOn: html [
	html
		mdlLayoutDrawer: [ 
			html
				mdlNavigation: [ 
					self possiblePages
						do: [ :aClass | 
							html mdlNavigationLink
								beCurrentIf: aClass = self rootComponent componentToDisplay class;
								callback: [ self displayInstanceOf: aClass ];
								with: aClass pageName ] ] ]
]
