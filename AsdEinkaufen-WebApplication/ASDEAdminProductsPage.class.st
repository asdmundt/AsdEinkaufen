Class {
	#name : #ASDEAdminProductsPage,
	#superclass : #ASDEPageAdmin,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEAdminProductsPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ 'Produktverwaltung'
]

{ #category : #accessing }
ASDEAdminProductsPage class >> priority [
	^ 2
]

{ #category : #rendering }
ASDEAdminProductsPage >> renderContentOn: html [
	html mdlGrid
		style: 'height: 700px;';
		with: [ html mdlCell
				stretch;
				middle;
				size: 8;
				with: [ html text: 'khjkhkhjh' ] ]
]
