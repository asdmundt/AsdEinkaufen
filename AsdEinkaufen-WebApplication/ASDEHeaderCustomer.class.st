Class {
	#name : #ASDEHeaderCustomer,
	#superclass : #ASDEHeader,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEHeaderCustomer >> possiblePages [
	self session isLogged
		ifTrue: [ self session currentUser isAdmin
				ifTrue: [ ^ ASDEPageAdmin pagesToDisplay ]
				ifFalse: [ ^ ASDEPageLogin pagesToDisplay ] ]
		ifFalse: [ ^ ASDEPage pagesToDisplay ]
]

{ #category : #rendering }
ASDEHeaderCustomer >> renderAccountButtonOn: html [
	html
		mdlNavigation: [ html mdlButton icon
				id: #bottomLeftButton;
				with: [ html mdlIcon: #account_circle ].
			html mdlMenu
				bottomRight;
				for: #bottomLeftButton;
				with: [ html div 
					style: 'width: 50px; height:50px;';
					with: [ html text: 'test' ] ] ]
]

{ #category : #rendering }
ASDEHeaderCustomer >> renderButtonsOn: html [
	self session isLogged
		ifTrue: [ 
			html
		mdlNavigation: [
			self renderAccountButtonOn: html ]]
]

{ #category : #rendering }
ASDEHeaderCustomer >> renderContentOn: html [
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
ASDEHeaderCustomer >> renderDrawerOn: html [
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
