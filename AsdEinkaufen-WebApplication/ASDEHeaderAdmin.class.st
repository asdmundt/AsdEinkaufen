Class {
	#name : #ASDEHeaderAdmin,
	#superclass : #ASDEHeader,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #initalize }
ASDEHeaderAdmin >> initialize [
	super initialize.
	
]

{ #category : #accessing }
ASDEHeaderAdmin >> possiblePages [
	self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDEPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDEPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDEPage pagesToDisplay ]
]

{ #category : #rendering }
ASDEHeaderAdmin >> renderDrawerOn: html [
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
