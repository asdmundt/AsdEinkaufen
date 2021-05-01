Class {
	#name : #ASDEResellerPage,
	#superclass : #ASDEPage,
	#category : #'AsdEinkaufen-WebApplication-Pages'
}

{ #category : #accessing }
ASDEResellerPage class >> pageName [
	^ 'Hello world'
]

{ #category : #accessing }
ASDEResellerPage class >> priority [
	^ 1
]

{ #category : #rendering }
ASDEResellerPage >> renderContentOn: html [
	html mdlGrid
		style: 'align-items: center; height: 200px; width:100%; ';
		with: [ html mdlCell
				stretch;
				size: 12;
				with: [ html div
						with: [self renderRegisterOn: html] ] ]
]

{ #category : #rendering }
ASDEResellerPage >> renderRegisterOn: html [
	html mdlCard
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 70%; height: 100%;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: 'Konto anlegen' level: 2 ].
			html mdlCardTextContainer: [ " "  html
				definitionList: [ html definitionTerm: 'Material Design'.
					html
						definitionData: [ html
								paragraph: [ html
										text:
											'Material Design Lite (MDL) is a library of components for web developers based on Google''s Material Design Philosophy: "A visual language for our users that synthesizes the classic principles of good design with the innovation and possibility of technology and science." Understanding the goals and principles of Material Design is critical to the proper use of the Material Design Lite components. If you have not yet read the '.
									html anchor
										url: 'https://material.io/guidelines/material-design/';
										target: '_blank';
										with: 'Material Design Introduction'.
									html
										text: ' you should do so before attempting to use the components.' ] ] ]  ] ]
]
