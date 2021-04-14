"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #ASDEHeader,
	#superclass : #ASDEComponent,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEHeader >> possiblePages [
	self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDEPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDEPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDEPage pagesToDisplay ]
]

{ #category : #rendering }
ASDEHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ 
			html
				mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: 'Einkaufen in Frankfurt' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ] ].
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
