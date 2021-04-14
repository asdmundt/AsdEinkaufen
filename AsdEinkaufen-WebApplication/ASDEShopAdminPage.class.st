Class {
	#name : #ASDEShopAdminPage,
	#superclass : #ASDEPageAdmin,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #rendering }
ASDEShopAdminPage >> renderContentOn: html [
	html mdlGrid
		style: 'height: 700px;';
		with: [ html mdlCell
				stretch;
				middle;
				size: 12;
				with: [  ] ]
]
