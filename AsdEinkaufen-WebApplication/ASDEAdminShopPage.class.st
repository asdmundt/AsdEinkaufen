Class {
	#name : #ASDEAdminShopPage,
	#superclass : #ASDEPageAdmin,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEAdminShopPage class >> pageName [
	^ 'Shop Verwaltung'
]

{ #category : #accessing }
ASDEAdminShopPage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDEAdminShopPage >> renderContentOn: html [
	html mdlGrid
		style: 'height: 700px;';
		with: [ html mdlCell
				stretch;
				middle;
				size: 12;
				with: [  ] ]
]
